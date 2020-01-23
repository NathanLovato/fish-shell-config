#!/usr/bin/env fish

set bookmarks_path $HOME/.config/bookmarks

function bookmarks --description "Print, jump to, or move files to bookmarked locations"
    argparse --name=bookmarks --min-args 1 'h/help' 'j/jump' -- $argv
    or return

    if [ $_flag_help ]
        echo "Print, jump to, or move files to bookmarked locations
        Usage:
        bookmarks [OPTIONS] $bookmark_label

        Flags:
        -h/--help -- Display this help message.
        -j/--jump -- Jump to the bookmarked path.
        "
        return
    end

    if not test -f $bookmarks_path
        echo "The bookmark file $bookmarks_path does not exist"
        return
    end

    set delimiter \t
    set index (contains -i $argv[1] (cut -d $delimiter -f 1 $bookmarks_path))
    if [ $index ]
        set paths (cut -d $delimiter -f 2 $bookmarks_path)
        set path_target $paths[$index]
        if [ $_flag_j ]; and test -d $path_target
            cd $path_target
        else
            echo $path_target
        end
    end
end

complete -c bookmarks -f -a (string join " " (cut -d \t -f 1 $bookmarks_path))
complete -c bookmarks -s j -l jump
