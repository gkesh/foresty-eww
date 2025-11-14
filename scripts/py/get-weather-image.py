#!/usr/bin/env python3
"""
Weather Image Path Selector
Returns the absolute path to a weather icon based on condition and time of day.
"""

import os
import sys
from pathlib import Path
from datetime import datetime

# Base directory containing weather images
ASSETS_DIR = Path("assets/weather")

# Weather condition mappings for inxi output
WEATHER_MAPPINGS = {
    "day": {
        # Clear/Sunny conditions
        "clear": "day_sunny.png",
        "clear sky": "day_sunny.png",
        "sunny": "day_sunny.png",
        "fair": "day_sunny.png",
        "mostly clear": "day_sunny.png",
        
        # Cloudy conditions
        "cloudy": "day_cloudy.png",
        "partly cloudy": "day_cloudy.png",
        "mostly cloudy": "day_cloudy.png",
        "broken clouds": "day_cloudy.png",
        "overcast": "day_cloudy.png",
        "fog": "day_cloudy.png",
        "mist": "day_cloudy.png",
        "haze": "day_cloudy.png",
        
        # Rainy conditions
        "rain": "day_rainy.png",
        "rainy": "day_rainy.png",
        "light rain": "day_rainy.png",
        "moderate rain": "day_rainy.png",
        "heavy rain": "day_rainy.png",
        "drizzle": "day_rainy.png",
        "showers": "day_rainy.png",
        "rain showers": "day_rainy.png",
        
        # Snow conditions
        "snow": "day_snowy.png",
        "snowy": "day_snowy.png",
        "light snow": "day_snowy.png",
        "moderate snow": "day_snowy.png",
        "heavy snow": "day_snowy.png",
        "snow showers": "day_snowy.png",
        "flurries": "day_snowy.png",
        "sleet": "day_snowy.png",
        "ice": "day_snowy.png",
        
        # Thunderstorm conditions
        "thunderstorm": "day_thunderstorms.png",
        "thunderstorms": "day_thunderstorms.png",
        "thunder": "day_thunderstorms.png",
        "tstorms": "day_thunderstorms.png",
        
        # Windy conditions
        "windy": "day_windy.png",
        "breezy": "day_windy.png",
        "blustery": "day_windy.png",
    },
    "night": {
        # Clear conditions
        "clear": "night_clear.png",
        "clear sky": "night_clear.png",
        "sunny": "night_clear.png",
        "fair": "night_clear.png",
        "mostly clear": "night_clear.png",
        
        # Cloudy conditions
        "cloudy": "night_cloudy.png",
        "partly cloudy": "night_cloudy.png",
        "mostly cloudy": "night_cloudy.png",
        "overcast": "night_cloudy.png",
        "fog": "night_cloudy.png",
        "mist": "night_cloudy.png",
        "haze": "night_cloudy.png",
        "broken clouds": "night_cloudy.png",
        
        # Rainy conditions (includes thunderstorms at night)
        "rain": "night_rainy.png",
        "rainy": "night_rainy.png",
        "light rain": "night_rainy.png",
        "moderate rain": "night_rainy.png",
        "heavy rain": "night_rainy.png",
        "drizzle": "night_rainy.png",
        "showers": "night_rainy.png",
        "rain showers": "night_rainy.png",
        "thunderstorm": "night_rainy.png",
        "thunderstorms": "night_rainy.png",
        "thunder": "night_rainy.png",
        "tstorms": "night_rainy.png",
        
        # Snow conditions
        "snow": "night_snowy.png",
        "snowy": "night_snowy.png",
        "light snow": "night_snowy.png",
        "moderate snow": "night_snowy.png",
        "heavy snow": "night_snowy.png",
        "snow showers": "night_snowy.png",
        "flurries": "night_snowy.png",
        "sleet": "night_snowy.png",
        "ice": "night_snowy.png",
        
        # Windy conditions (fallback to cloudy)
        "windy": "night_cloudy.png",
        "breezy": "night_cloudy.png",
        "blustery": "night_cloudy.png",
    }
}

def get_time_of_day(hour=None):
    """Determine if it's day or night based on hour (6 AM - 6 PM is day)."""
    if hour is None:
        hour = datetime.now().hour
    return "day" if 6 <= hour < 18 else "night"

def get_weather_image_path(condition):
    """
    Get absolute path for weather image based on condition and time of day.
    
    Args:
        condition: Weather condition (e.g., 'sunny', 'rainy', 'cloudy')
        time_of_day: 'day' or 'night' (auto-detected if None)
    
    Returns:
        Absolute path to the weather image file
    """
    # Normalize condition
    condition = condition.lower().strip()
    time_of_day = get_time_of_day()
    
    # Get filename from mappings
    if condition not in WEATHER_MAPPINGS[time_of_day]:
        filename = WEATHER_MAPPINGS[time_of_day]["clear"]
    else:
        filename = WEATHER_MAPPINGS[time_of_day][condition]
    
    # Construct and return absolute path
    abs_path = (ASSETS_DIR / filename).resolve()
    
    # Check if file exists
    if not abs_path.exists():
        print(f"Warning: File does not exist at {abs_path}", file=sys.stderr)
    
    return str(abs_path)

def main():
    """Command line interface."""
    if len(sys.argv) < 2:
        print("Usage: python script.py <weather_condition> [day|night]")
        print("\nAvailable conditions:")
        print("  Day: cloudy, rainy, snowy, sunny, clear, thunderstorms, thunder, windy")
        print("  Night: cloudy, rainy, snowy, clear, thunderstorms, thunder, windy")
        print("\nExamples:")
        print("  python script.py sunny")
        print("  python script.py rainy night")
        print("  python script.py thunderstorms day")
        sys.exit(1)
    
    condition = sys.argv[1]
    
    try:
        image_path = get_weather_image_path(condition)
        print(image_path)
    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()