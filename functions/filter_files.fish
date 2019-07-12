function filter_files --description "Outputs a list of valid files, optionally filtered with a list of extensions"
    argparse --name=filter_files --min-args 1 'e/extensions=' -- $argv
    or return

    set extensions (string split " " $_flag_extensions)
    set files
    for f in $argv
        set name (basename $f)
        set extension (string split "." --right $name)[-1]

        if not test -f $f
            continue
        end
        if [ $extensions ]
            if not contains $extension $extensions
                continue
            end
        end
        set files $files $f
    end
    echo $files
end
