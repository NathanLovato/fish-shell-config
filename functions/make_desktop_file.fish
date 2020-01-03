function make_desktop_file --description 'Create a shortcut .desktop file for the gnome desktop'
    argparse --name 'make_desktop_file' 'n/name=' 'e/exec=' 'i/icon=' 't/type=' 'c/comment=' 'd/dry_run' -- $argv
    or return

    if not [ $_flag_name ]
        echo 'You must provide the name of the program'
        return
    end
    if not [ $_flag_exec ]
        echo 'You must provide the path to the executable of the program'
        return
    end

    set directory ~/.local/share/applications
    set output_path $directory/$_flag_name.desktop

    set type 'Application'
    if [ $_flag_type ]
        set type $_flag_type
    end

    set icon ''
    if [ $_flag_icon ]
        set icon (realpath $_flag_icon)
    end

    set executable_path (realpath $_flag_exec)

    set template "[Desktop Entry]
Name=$_flag_name
Exec=$executable_path
Type=$type
Encoding=UTF-8"

    if [ $icon ]
        set template $template \n"Icon=$icon"
    end
    if [ $_flag_comment ]
        set template $template \n"Comment=$_flag_comment"
    end
    if [ $_flag_category ]
        set template $template \n"Category=$_flag_category"
    end

    echo Creating desktop file in $output_path
    echo Content:\n$template
    return
    echo $template >> $output_path
end
