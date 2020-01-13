function filter_folders --description "Outputs a list of valid folders"
    set folders
    for arg in $argv
        if test -d $arg
            set folders $folders $arg
        end
    end
    echo $folders
end
