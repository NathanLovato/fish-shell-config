#!/usr/bin/env fish

function count_days --description "Count the days between two dates"
    argparse --name=count_days 'h/help' -- $argv
    or return

    if [ $_flag_help ]
        echo "Count the days between two dates
        Usage:
        count_days [OPTIONS] date_1 date_2
        Outputs the number of days between the two dates, rounded to 2 decimals.
        The dates can be in any format the date program supports: yesterday, YYmmdd, iso format, etc.
        "
        return
    end

    set date_1 $argv[1]
    set date_2 $argv[2]
    math --scale=2 abs\(\((date -d $date_1 +%s) - (date -d $date_2 +%s)\) / \(3600 \* 24\)\)
end
