function workspace_reset
    set programs firefox chrome nautilus discord obs zathura zeal steam lutris
    for i in $programs
        pkill $i
    end
    emacs $HOME/Dropbox/org/1.todo.org
end
