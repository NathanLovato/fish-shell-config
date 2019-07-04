function accounting_file_expense --description 'Move a file to today in the accounting folder'
    set expenses_folder "/home/gdquest/Dropbox/Files/2019/company/2.expenses"
    set date (date -I)
    set month (echo $date | cut -d "-" -f 2)
    set target_folder {$expenses_folder}/{$month}
    if not test -d $target_folder
        mkdir $target_folder
    end
    if not [ $argv ]
        echo 'No files passed to the function, nothing to do'
        return
    end

    set extensions (string split " " "pdf jpg jpeg png") 
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
