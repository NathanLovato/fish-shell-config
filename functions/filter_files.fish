function filter_files --description "Outputs a list of existing files, optionally filtered with a list of extensions"
    argparse --name=filter_files --min-args 1 'e/extensions=' -- $argv
    or return

    set extensions (string split " " $_flag_extensions)
    set files
    for f in $argv
        if not test -f $f
            echo $f does not exist
            continue
        end

        set name (basename $f)
        set extension (string split "." --right $name)[-1]

        if not contains $extension $extensions
            echo "$f doesn't have a valid extension in $extensions"
            continue
        end
        set files $files $f
    end
    echo $files
end
