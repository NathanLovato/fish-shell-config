function accounting_file_expense --description "Move a file to the right expense folder and dates the file"
    set root_directory "/home/gdquest/Dropbox/Files/"(date +%Y)"/company/2.frais"
    argparse --name=accounting_file_expense --min-args 1 'd/date=' 't/type=' -- $argv
    or return

    set extensions "pdf jpg jpeg png"
    set file_list (filter_files $argv --extensions $extensions)
    if not [ $file_list ]
        echo "None of the file paths exists, canceling"
        return
    end

    set date (date -I)
    if [ $_flag_date ]
        set date (date -d $_flag_date -I)
    end
    set month (echo $date | cut -d "-" -f 2)

    if [ $_flag_type = "shared" ]
        set directory $root_directory/3.partagés
    else if [ $_flag_type = "personal" ]
        set directory $root_directory/2.personnels
    else
        set directory $root_directory/1.pros
    end

    set target_folder {$directory}/{$month}
    if not test -d $target_folder
        mkdir $target_folder
    end

    set extensions_list (string split " " $extensions)
    for f in $file_list
        set name (basename $f)
        set extension (string split "." --right $name)[-1]

        if not contains $extension $extensions_list
            echo The extension of $f, $extension, is not in $extensions_list
            continue
        end

        set path {$target_folder}/{$date}-(basename $f)
        mv $f $path && echo "moved" $f "to" $path
    end
end

complete -c accounting_file_expense -s d -l date
complete -c accounting_file_expense -s t -l type -a "personal shared pro"
