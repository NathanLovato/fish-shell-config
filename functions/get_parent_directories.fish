#!/usr/bin/env fish

function get_parent_directories --description "Takes a dirpath or the current working directory and returns parent directory paths"
    argparse --name=open_godot_project 'h/help' 'r/recursive' -- $argv
    or return

    set dirpath (pwd)
    if [ $argv ]
        set dirpath $argv[1]
    end

    set path_components (string split "/" $dirpath)
    if [ $_flag_recursive ]
        # Subtract one because absolute paths start with /
        set iterations (math (count $path_components) - 1)
    end

    set count 1

    set parent $dirpath
    while test $count != $iterations
        set parent (string split -r -m 1 "/" $parent)[1]
        echo $parent
        set count (math $count + 1)
    end
end
