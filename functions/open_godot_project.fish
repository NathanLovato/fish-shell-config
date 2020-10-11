#!/usr/bin/env fish

function open_godot_project --description 'Searches for Godot projects and opens the first project found.'
    argparse --name=open_godot_project 'p/path=' 'e/executable=' 'r/run' 'h/help' -- $argv
    or return

    if [ $_flag_help ]
        echo "
        Searches for Godot projects and opens the first project found.
        The executable godot must be available on the PATH

        Usage:
        open_godot_project [OPTIONS] -- arguments

        Flags:
        -h/--help     -- Display this help message.
        -p/--path     -- Starting path to search for the project.
        -e/--edge     -- Use godot-edge as the Godot executable instead of godot. The executable must be available on the PATH.
        -e/--executable  -- Use a specific Godot executable, from the PATH, or from /usr/local/bin/.
        -r/--run      -- Play the game instead of opening the editor.

        This program passes all extra arguments as-is to the godot executable.
        For example, this command will run the Godot project full-screen:

        open_godot_project -r -- -f"
        return
    end

    set project_file (find $_flag_path -iname project.godot -print -quit)
    if not [ $project_file ]
        set project_file ($_flag_path)
    end

    set flag_editor '-e'
    if [ $_flag_run ]; set flag_editor ''; end

    set executable godot
    if [ $_flag_executable ]
        set executable $_flag_executable
    end

    $executable $flag_editor -u $project_file $argv
end
