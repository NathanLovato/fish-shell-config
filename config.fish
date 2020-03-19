set -gx EDITOR emacsclient -t -a ""
set -gx VISUAL emacsclient -c -a ""
set -gx ALTERNATE_EDITOR nvim

source $HOME/.config/fish/conf.d/abbreviations.fish
alias godot godot3.2

if not set --query ARE_FORMAT_VARS_INITIALIZED
    echo 'Setting format_* variables for text formatting'

    set -Ux ARE_FORMAT_VARS_INITIALIZED

    set -Ux format_normal (tput sgr0)
    set -Ux format_bold (tput bold)
    set -Ux format_italic (tput sitm)
    set -Ux format_underline (tput smul)

    set -Ux format_color_black (tput setaf 1)
    set -Ux format_color_red (tput setaf 1)
    set -Ux format_color_green (tput setaf 2)
    set -Ux format_color_yellow (tput setaf 3)
    set -Ux format_color_blue (tput setaf 4)
    set -Ux format_color_magenta (tput setaf 5)
    set -Ux format_color_cyan (tput setaf 6)
    set -Ux format_color_white (tput setaf 7)

    set -Ux format_blink (tput blink)
end
