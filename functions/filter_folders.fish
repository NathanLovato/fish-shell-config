function filter_folders --description "Outputs a list of valid folders"
    set folders
    for i in $argv
        if test -d $i
            set folders $folders $i
        end
    end
    echo $folders
end
