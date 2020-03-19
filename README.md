# Fish shell config

My fish shell configuration and functions.

## Functions ##

Look at the `functions/` directory for the full list. Fish loads them automatically if they are in your fish config directory.

- `abbreviations_erase_all`: Erase all abbreviations and optionally refresh them. Useful when editing abbreviations on the fly.
- `accounting_auto_rename_documents`: Renames the documents passed as an input.
- `accounting_file_expense`: Names and archives a file for my accountant.
- `add_to_user_path`: Persistently prepends to your PATH via fish_user_paths.
- `assets_move_to_directory`: Finds and moves image files in subdirectories to a given directory, replicating the folder structure.
- `bookmarks`: Print, jump to, or move files to bookmarked locations.
- `count_days`: Count the days between two dates.
- `ffmpeg_compress_nvenc`: Compresses a video using the nvenc gpu encoder from NVidia, mostly for the web. Outputs an mp4 video.
- `ffmpeg_remap_audio`: Replaces a video's audio track with another audio file.
- `ffmpeg_to_mp4_fastdecode`: Transcodes video footage to an editing-friendly format, using a slight amount of compression. It's not as heavy as using a format like Prores, encodes faster, offers great performances in Blender's Video Sequence Editor, and it's good enough for YouTube videos.
- `image_compress_and_overwrite`: Compress and overwrite png files with pngquant.
- `image_website_resize_banner`: Resizes and compresses one or more images to use as a banner on the website, using `imagemagick` and `pngquant`.
- `make_desktop_file`: Creates a shortcut .desktop file for the gnome desktop.
- `open_godot_project`: Searches for Godot projects and opens the first project found.
- `video_create_blender_projects`: Create one or more video editing projects with Blender.
- `video_move_and_create_thumbnail`: Move the video to the youtube-exports folder, create a copy of the Youtube thumbnail template, and open it in Krita.
- `video_youtube_livestream`: Start the programs to set up or work on a livestream.
- `workspace_reset`: Kills programs and resets my workspace before moving to another project.
- `youtube_dl_add_to_list`: Add one or more URLs to the list of youtube videos and playlists to download.
- `youtube_dl_all`: Download all urls from a file passed as an argument.

### Utility functions ###

- `filter_files`: Outputs a list of files filtered by a list of extensions.
- `filter_folders`: Outputs a list of valid directory paths.
- `get_parent_directory`: Outputs the parent of a directory. Works recursively.
- `path_sanitize`: Sanitizes a file name taking a path as input. Remove trailing whitespace from the basename, replaces whitespace and dashes with one dash, and makes it lowercase.


## Autocompletion ##

- [hub](https://github.com/github/hub), a command-line tool to interact with GitHub efficiently.
- [ffmpeg](https://ffmpeg.org/), a powerful tool to convert and stream video and audio.

## Configuration ##

Fish doesn't need a lot of configuration. I use some plugins from the plugin manager [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish):

- Colored man pages to add colors to manual pages
- fasd to quickly find recent files and directories
- The sylb20nr theme for the prompt

For the syntax highlighting color theme, I use `dracula`, that comes built-into fish. Type `fish_config` to open the configuration window in the browser and change the color theme.

