#!/usr/bin/env fish

function get_parent_directories --description "Takes a dirpath or the current working directory and returns parent directory paths"
    argparse --name=open_godot_project 'h/help' 'r/recursive' 'm/max=' -- $argv
    or return

    if [ $_flag_help ]
        echo '
        Outputs the parent(s) of a given directory or, if you do not
        provide any path, of the current working directory.

        Usage:

        get_parent_directories [options] -- path

        Options:

        -r/--recursive -- output all the parent directories.
        -m/--max -- if using the --recursive option, maximum number of
        directories to iterate over going up.

        Example:
        \$ get_parent_directories -r -m 2 /home/me/Pictures/2019/trip-to-portugal
        /home/name/Pictures/2019
        /home/name/Pictures
        '
        return
    end

    set dirpath (pwd)
    if [ $argv[1] ]
        set dirpath $argv[1]
        if test -d $argv[1]
            set dirpath (dirname $argv[1])
        end
    end
    set dirpath (string trim -r -c / $dirpath)

    set count_components 1
    if [ $_flag_recursive ]
        set path_components (string split "/" $dirpath)
        set count_components (count $path_components)
    end

    set iterations $count_components
    if test -n $_flag_max; and test $_flag_max -lt $iterations
        set iterations $_flag_max
    end

    set i 0
    set parent $dirpath
    while test $i != $iterations

        set parent (string split -r -m 1 "/" $parent)[1]
        if test -z $parent
            return
        end
        echo $parent
        set i (math $i + 1)
    end

end
