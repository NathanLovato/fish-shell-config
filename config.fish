# Using vi mode
fish_vi_key_bindings

set ALTERNATE_EDITOR ""
set EDITOR "emacsclient -c"
set VISUAL "emacsclient -c -a emacs"

# Abbreviations
if not set -q abbrs_initialized
    set -U abbrs_initialized
    echo -n Setting abbreviations...

    abbr g 'git'
    abbr ga 'git add'
    abbr gb 'git branch'
    abbr gbl 'git blame'
    abbr gc 'git commit -m'
    abbr gco 'git checkout'
    abbr gcp 'git cherry-pick'
    abbr gd 'git diff'
    abbr gf 'git fetch'
    abbr gl 'git log'
    abbr gm 'git merge'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gr 'git remote'
    abbr gs 'git status'
    abbr gst 'git stash'

    abbr e 'emacs .'

    abbr p2 'python2'
    abbr p3 'python3'
    abbr p 'python3'

    abbr f 'firefox '
    abbr fs 'firefox --search'
    abbr fsy 'firefox https://www.youtube.com/results\?search_query='

    abbr br 'bpsrender -w 6 '
    abbr bp 'bpsproxy .'

    abbr ai 'sudo apt install'
    abbr au 'sudo apt update'
    abbr aug 'sudo apt upgrade'
    abbr ar 'sudo apt remove'
    abbr aar 'sudo apt autoremove'
    abbr as 'apt search'
    abbr asw 'apt show'

    abbr hnp 'hugo new post/2019/'
    abbr hn 'hugo new'
    abbr hs 'hugo server -D'
    abbr h 'hugo'

    abbr n 'nautilus .'

    abbr yt 'youtube-dl'
    abbr ytt 'youtube-dl --list-thumbnail'

    echo 'Done'
end
