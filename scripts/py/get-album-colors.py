import cv2
import numpy as np
import argparse
import sys
import os


def extract_colors_by_histogram(image_path, num_colors=5):
    """
    Alternative method: Extract colors using color histogram binning.
    
    Args:
        image_path: Path to the image file
        num_colors: Number of primary colors to extract
    
    Returns:
        colors: List of RGB color tuples
        percentages: List of percentages for each color
    """
    # Read image
    img = cv2.imread(image_path)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    
    # Create bins for each color channel (divide 256 values into bins)
    bins = 8  # This creates 8x8x8 = 512 color bins
    hist_r = np.histogram(img[:,:,0], bins=bins, range=(0, 256))[0]
    hist_g = np.histogram(img[:,:,1], bins=bins, range=(0, 256))[0]
    hist_b = np.histogram(img[:,:,2], bins=bins, range=(0, 256))[0]
    
    # Create 3D histogram
    pixels = img.reshape(-1, 3)
    color_indices = (pixels // (256 // bins))
    
    # Count colors
    color_dict = {}
    for pixel in color_indices:
        key = tuple(pixel)
        color_dict[key] = color_dict.get(key, 0) + 1
    
    # Get top colors
    sorted_colors = sorted(color_dict.items(), key=lambda x: x[1], reverse=True)
    top_colors = sorted_colors[:num_colors]
    
    # Convert back to RGB values (use center of bin)
    bin_size = 256 // bins
    colors = np.array([
        [int(idx[0] * bin_size + bin_size // 2),
         int(idx[1] * bin_size + bin_size // 2),
         int(idx[2] * bin_size + bin_size // 2)]
        for idx, count in top_colors
    ])
    
    total_pixels = len(pixels)
    percentages = [(count / total_pixels * 100) for idx, count in top_colors]
    
    return colors, percentages

def rgb_to_hex(rgb):
    """Convert RGB tuple to hex color code."""
    return '#{:02x}{:02x}{:02x}'.format(rgb[0], rgb[1], rgb[2])

# Example usage
if __name__ == "__main__":
    # Set up argument parser
    parser = argparse.ArgumentParser(
        description='Extract primary colors from an image',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
        Examples:
        python script.py image.jpg
        python script.py image.jpg --colors 8
        '''
    )
    
    parser.add_argument('image', 
                        help='Path to the image file')
    parser.add_argument('-c', '--colors', 
                        type=int, 
                        default=4,
                        help='Number of primary colors to extract (default: 4)')
    
    args = parser.parse_args()
    
    # Check if image file exists
    if not os.path.isfile(args.image):
        print("")
    
    image = args.image.replace("file://", "")
    colors, _ = extract_colors_by_histogram(image, num_colors=args.colors)
    
    bg = ""
    for i, color in enumerate(colors):
        bg = bg + f"linear-gradient(217deg, rgb({color[0]:3d} {color[1]:3d} {color[2]:3d} / 80%), transparent 70.71%),"
    
    print(f"background: {bg[0:-1]};")
