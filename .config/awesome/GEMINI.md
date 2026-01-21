## Project Overview

This directory contains the configuration files for the Awesome window manager, a highly configurable, next-generation framework window manager for X. The configuration is written in Lua.

The project consists of a main configuration file `rc.lua` and a theme file `theme.lua`. Additionally, it includes a more advanced and modularized configuration within the `robberfox/AwesomeFox` directory. This modularized setup separates concerns like appearance, keybindings, and core logic into different files and directories, making it easier to manage and customize.

### Key Files

*   **`rc.lua`**: The main entry point for the AwesomeWM configuration. It loads necessary libraries, defines the overall layout and behavior of the window manager, and includes other configuration files.
*   **`theme.lua`**: Defines the visual theme for AwesomeWM, including colors, fonts, icons, and wallpapers.
*   **`robberfox/AwesomeFox/`**: A directory containing a more advanced and modularized AwesomeWM configuration.
    *   **`rc.lua`**: The main file for the AwesomeFox configuration.
    *   **`README.md`**: Provides a detailed explanation of the modularized structure.
    *   **`appearance/`**: Contains files for customizing the visual elements of the wibar (the status bar) and other widgets.
    *   **`key/`**: Defines all the keybindings and mouse button mappings.
    *   **`main/`**: Includes the core logic for layouts, rules for managing windows, and signal handling.
    *   **`module/`**: Contains modules for autostarting applications and other custom functionalities.
    *   **`script/`**: A collection of shell scripts for controlling system settings like screen brightness and audio volume.

## Usage

To use this configuration, you need to have AwesomeWM installed. The configuration is loaded automatically when AwesomeWM starts.

The main configuration is in `rc.lua`. To switch to the more advanced `AwesomeFox` configuration, you would typically replace the contents of the main `rc.lua` with the contents of `robberfox/AwesomeFox/rc.lua`, or symlink it.

### Customization

The configuration is highly customizable. Here are some common areas for modification:

*   **Theme**: To change the look and feel, you can edit `theme.lua`. This includes changing colors, fonts, and the wallpaper.
*   **Keybindings**: To modify the keyboard shortcuts, you can edit the files in the `key/` directory within the `AwesomeFox` configuration.
*   **Autostart**: To add or remove applications that start automatically with the window manager, you can edit the `autostart.lua` file in the `module/` directory.

## Development Conventions

The `AwesomeFox` configuration follows a modular design pattern, separating different aspects of the configuration into their own files and directories. This makes the codebase cleaner and easier to maintain.

When making changes, it is recommended to follow the existing structure. For example, new keybindings should be added to the appropriate file in the `key/` directory, and new visual components should be placed in the `appearance/` directory.
