function workspace_reset
    set programs firefox chrome nautilus discord obs zathura zeal
    for i in $programs
        pkill $i
    end
    emacs $HOME/Dropbox/org/1.todo.org
    nmcli networking off
    pkill tilix
end
