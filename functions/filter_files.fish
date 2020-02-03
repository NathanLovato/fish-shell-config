function filter_files --description "Outputs a list of existing files, optionally filtered with a list of extensions"
    argparse --name=filter_files --min-args 1 'e/extensions=' 'i/ignore_case' -- $argv
    or return

    set extensions (string split " " $_flag_extensions)
    if [ $_flag_ignore_case ]
        set extensions (echo $extensions | tr [:upper:] [:lower:])
    end

    set files
    for f in $argv
        if not test -f $f
            continue
        end

        set name (basename $f)
        set extension (string split "." --right $name)[-1]

        if not contains $extension $extensions
            continue
        end
        set files $files $f
    end

    # Output
    for f in $files
        echo $f
    end
end
