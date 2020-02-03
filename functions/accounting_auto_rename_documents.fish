function accounting_auto_rename_documents --description "Renames the documents passed as an input"
    argparse --name=accounting_auto_rename_documents 'h/help' 'p/print' -- $argv
    or return

    if [ $_flag_help ]
        echo "Renames the documents passed as an input
        Usage:
        accounting_auto_rename_documents file1 file2 ...

        Flags:
        -h/--help  -- Display this help message.
        -p/--print -- Echo the renamed documents to standard output.
        "
        return
    end

    set extensions "pdf jpg jpeg png"
    set files (filter_files $argv --extensions $extensions)
    for file in $files
        set extension (string split "." $file)[-1]
        set dirpath (dirname $file)

        # Bank statements
        set keyword (echo $file | grep -Eio "^(EXTRAIT)|(FACPRO)")
        if not [ $keyword = "" ]
            set account_number (echo $file | grep -Eio "[[:digit:]]{11}")
            set date_digits (string sub -l 8 (echo $file | grep -Eio -e "[[:digit:]]{8}\."))
            set date (echo $date_digits | date -I)
            set filename $date-(echo $keyword | tr [:upper:] [:lower:])-compte-$account_number-banque-populaire.$extension
            if [ $dirpath != "" ]
                set filename $dirpath/$filename
            end

            if [ $_flag_print ]
                echo $filename
            else
                mv -v $file $filename
            end
            continue
        end
    end
end
