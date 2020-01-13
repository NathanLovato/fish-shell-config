#!/usr/bin/env fish

function open_godot_project --description 'Searches for Godot projects and opens the first project found.'
    argparse --name=open_godot_project 'p/path=' 'e/edge' 'r/run' 'h/help' -- $argv
    or return

    if [ $_flag_help ]
        echo "Searches for Godot projects and opens the first project found."
        echo "The executable godot must be available on the PATH"
        echo "Usage: open_godot_project [OPTIONS] -- arguments

        -h/--help -- Display this help message.
        -p/--path -- Starting path to search for the project.
        -e/--edge -- Use godot-edge as the Godot executable instead of godot. The executable must be available on the PATH.
        -r/--run  -- Play the game instead of opening the editor.

        This program passes all extra arguments as-is to the godot executable.
        For example, this command will run the Godot project full-screen:

        open_godot_project -r -- -f"
        return
    end

    set project_file (find $_flag_path -iname project.godot -print -quit)
    if not [ $project_file ]
        set parent_directories (get_parent_directory -r -m 5)
        for directory in $parent_directories
            set found_file (find $directory -maxdepth 1 -iname project.godot -print -quit)
            if test -f $found_file
                set project_file $found_file
                break
            end
        end
    end
    if not [ $project_file ]
        echo "No project file found in sub-folders and parent directories."
        return
    end

    if [ $_flag_run ]
        set project_file (dirname $project_file)
    end

    set executable godot
    if [ $_flag_edge ]
        set executable godot-edge
    end
    $executable $project_file $argv
end
