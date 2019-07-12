function accounting_file_expense --description "Move a file to the right expense folder and dates the file"
    set expenses_folder "/home/gdquest/Dropbox/Files/2019/company/2.expenses"
    argparse --name=accounting_file_expense --min-args 1 'd/date=' -- $argv
    or return

    set extensions (string split " " "pdf jpg jpeg png")
    set file_list (filter_files $argv --extensions $extensions)
    if not [ $file_list ]
        echo "None of the file paths exists, cancelling"
        return
    end

    set date (date -I)
    if [ $_flag_date ]
        set date (date -d $_flag_date -I)
    end
    set month (echo $date | cut -d "-" -f 2)

    set target_folder {$expenses_folder}/{$month}
    if not test -d $target_folder
        mkdir $target_folder
    end

    for f in $argv
        set name (basename $f)
        set extension (string split "." --right $name)[-1]

        if not contains $extension $extensions
            continue
        end

        set path {$target_folder}/{$date}-(basename $f)
        mv $f $path && echo "moved" $f "to" $path
    end
end
