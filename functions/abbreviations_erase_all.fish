function abbreviations_erase_all --description "Erase all registered abbreviations"
    argparse --name=abbreviations_erase_all 'r/refresh' -- $argv
    or return

    set temp_file (mktemp)
    abbr >> $temp_file
    echo -n "Removed abbreviations: "
    for i in (cut -f 5 -d " " $temp_file)
        if [ $i = \n ]; continue; end
        abbr --erase $i
        echo -n "$i "
    end
    if [ $_flag_refresh ]
        echo
        set --erase is_abbreviations_initialized
        source $HOME/.config/fish/conf.d/abbreviations.fish
    end
    rm $temp_file
end

complete -c abbreviations_erase_all -s r -l refresh
