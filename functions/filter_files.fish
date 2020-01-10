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
            echo "$f does not exist or is not a file"
            continue
        end

        set name (basename $f)
        set extension (string split "." --right $name)[-1]

        if not contains $extension $extensions
            # echo "$extension isn't a valid extension in $extensions"
            continue
        end
        set files $files $f
    end
    echo $files
end
