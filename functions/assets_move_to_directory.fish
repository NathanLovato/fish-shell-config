#!/usr/bin/fish

function assets_move_to_directory --description "Finds and moves image files in subdirectories to a given directory, replicating the folder structure"
    set project_root $HOME/Repositories/godot-metroidvania-2d/hook!-full-game/
    argparse --name=assets_move_to_directory --min-args 1 'h/help' 'c/copy' 's/source=' -- $argv
    or return

    if [ $_flag_help ]
        echo "
        Finds and moves image files in subdirectories to a given directory, replicating the folder structure.

        Usage:
        assets_move_to_directory [OPTIONS] output_directory

        Options:

        - -c/--copy: copy the assets instead of moving them
        - -s/--source dirpath: find files in that directory instead of the working directory. The path must point to a directory.
        "
        return
    end

    if not test -d $project_root
        echo Directory $project_root does not exist. Exiting.
        return
    end

    set source_directory (pwd)
    if [ $_flag_source ]
        if not test -d $_flag_source
            echo "$_flag_source is not a valid directory path"
            return
        end
        set source_directory $_flag_source
    end

    if [ $_flag_v ]; echo "Moving sprites from (pwd) to $project_root"; end
    for i in **{.png,.jpg,.jpeg}
        set directory (dirname $i)
        set name (basename $i)
        set file (string replace -i -r '_@\d\.\d+x' '' $name)
        set output_directory $project_root/assets/$directory
        mkdir --parents $output_directory

        if [ $_flag_copy ]
            cp $i $output_directory/$file
            if [ $_flag_v ]; echo "Copied $name -> $file"; end
        else
            mv $i $output_directory/$file
            if [ $_flag_v ]; echo "Moved $name -> $file"; end
        end
    end
end
