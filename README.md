# foresty-eww
EWW (Elkowar Wacky Widgets) configuration for my Xmonad Ubuntu setup

#### Background
My current primary configuration for the eww bar and some widgets, 
you can see the screenshots below to see how it looks and if you have any questions or 
problems while running the configs yourself, you can raise an error to let me know.
I am pretty active on github so I will help in any way I can.

I pulled the base from the config of the creator, you can find it [here](https://github.com/elkowar/dots-of-war/tree/master/eww-bar/.config/eww-bar).

#### Work Remaining:
- Fixing Workspaces: I have enabled the workspace sync in Xmonad by importing the `XMonad.Hooks.EwmhDesktops` and piping it to main, just gotta write the script generate buttons for the workspaces.
- Better event management: Hover events for some of the scales are a little wacky, gotta make them trigger more intuitively
- Notifications: Still haven't gotten `notify-send` working with xmonad. Gotta find a good workaround.

> Note: If you are wondering about the ascii art on the terminal, its a simple script I wrote in rust. You can find it [here](https://github.com/gkesh/artsci)

#### Screenshots
Here are some screenshots of the bar and my overall setup. Have fun.

![Screenshot from 2023-02-13 23-32-59](https://user-images.githubusercontent.com/27612533/218535925-fd08de50-0d3d-4a66-b75f-63bb42309483.png)
![Screenshot from 2023-02-13 23-34-16](https://user-images.githubusercontent.com/27612533/218537083-fbb9507e-5e6d-4d2b-99da-2130b13c207b.png)
![Screenshot from 2023-02-13 23-48-20](https://user-images.githubusercontent.com/27612533/218537133-0027d69e-0086-425b-b34a-f2a62232e2df.png)
