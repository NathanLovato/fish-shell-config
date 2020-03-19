#!/usr/bin/env fish

# Setting variables to defaults if they aren't set
if not set --query COMPANY_EXPENSES_DIRNAME_PROFESSIONAL
    set COMPANY_EXPENSES_DIRNAME_PROFESSIONAL professional
end
if not set --query COMPANY_EXPENSES_DIRNAME_PERSONAL
    set COMPANY_EXPENSES_DIRNAME_PERSONAL personal
end
if not set --query COMPANY_EXPENSES_DIRNAME_SHARED
    set COMPANY_EXPENSES_DIRNAME_SHARED shared
end

function accounting_file_expense --description "Move a file to the right expense folder and dates the file"
    argparse --name=accounting_file_expense --min-args 0 h/help 'd/date=' 't/type=' -- $argv
    or return

    if [ $_flag_help ]
        echo -e "
        Archives a file to a given company expense folder and prepends a date, for accounting
        purposes. The program archives files in monthly directories in your accounting folder.

        "$format_bold"Usage"$format_normal":
        accounting_file_expense [OPTIONS] file_1 [file_2, ...]

        "$format_bold"Flags"$format_normal":
        -h/--help     -- Display this help message.
        -d/--date -- Specify the date of the expense, if not today. The format is the same as for
         the GNU date program: yesterday, last\ week, 2020-01-23, 200123, etc. are all valid dates.
        -t/--type     -- The type of the expense, either pro, personal, or shared. They will

        "$format_bold"Configuration"$format_normal":
        To make this work for everyone, this program requires you to set a few variables. You can do
        so in your fish config, or in the shell directly, using "$format_italic"set -Ux VARIABLE_NAME value"$format_normal"

        "$format_bold"COMPANY_EXPENSES_PATH"$format_normal": the absolute path to your company's expenses accounting archive
        directory.
        "$format_bold"COMPANY_EXPENSES_DIRNAME_PROFESSIONAL"$format_normal": the name of your professional expenses directory.
        Default: \"professional\"
        "$format_bold"COMPANY_EXPENSES_DIRNAME_PERSONAL"$format_normal": the name of your personal expenses directory. Default:
        \"personal\"
        "$format_bold"COMPANY_EXPENSES_DIRNAME_SHARED"$format_normal": the name of your shared expenses directory. Default:
        \"shared\"
        "
        return
    end

    if not set --query COMPANY_EXPENSES_PATH
        echo "You must set the variable COMPANY_EXPENSES_PATH for this program to work. For more information, run accounting_file_expense --help"
        return
    end

    set extensions "pdf jpg jpeg png"
    set file_list (filter_files $argv --extensions $extensions)
    if not [ $file_list ]
        echo "None of the file paths are valid:

        $argv

        Supported file types: $extensions.
        Canceling the operation."
        return
    end

    set date (date -I)
    if [ $_flag_date ]
        set date (date -d $_flag_date -I)
    end
    set month (echo $date | cut -d "-" -f 2)

    switch $_flag_type
        case shared
            set directory $COMPANY_EXPENSES_PATH/$COMPANY_EXPENSES_DIRNAME_SHARED
        case personal
            set directory $COMPANY_EXPENSES_PATH/$COMPANY_EXPENSES_DIRNAME_PERSONAL
        case '*'
            set directory $COMPANY_EXPENSES_PATH/$COMPANY_EXPENSES_DIRNAME_PROFESSIONAL
    end

    set target_folder {$directory}/{$month}
    if not test -d $target_folder
        mkdir $target_folder
    end

    set extensions_list (string split " " $extensions)
    for f in $file_list
        set path {$target_folder}/{$date}-(basename $f)
        mv -v $f $path
    end
end

complete -c accounting_file_expense -s d -l date
complete -c accounting_file_expense -s t -l type -a "personal shared pro"
