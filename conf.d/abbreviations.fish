# Abbreviations
if not set -q abbrs_initialized
    set -U abbrs_initialized
    echo -n Setting abbreviations...

    # search
    abbr fi 'find . -iname'
    abbr g 'grep'
    abbr l 'locate'
    abbr lsd 'find * -maxdepth 0 -type d'
    abbr fsd 'find * -maxdepth 0 -type d'

    # navigation
    abbr t 'tree -C'
    abbr ... 'cd ../..'
    abbr .... 'cd ../../..'
    abbr ..... 'cd ../../../..'

    # clipboard paste
    abbr cbp "xclip -selection clipboard -o"
    abbr clipp "xclip -selection clipboard -o"
    abbr clippaste "xclip -selection clipboard -o"
    abbr cbg "xclip -selection clipboard -o"
    abbr clipg "xclip -selection clipboard -o"
    abbr clipget "xclip -selection clipboard -o"

    # clipboard copy
    abbr cbc "xclip -selection clipboard"
    abbr clipc "xclip -selection clipboard"
    abbr clipcopy "xclip -selection clipboard"

    # git
    abbr ga 'git add'
    abbr gb 'git branch'
    abbr gbl 'git blame'

    abbr gc 'git commit'
    abbr gcm 'git commit -m'
    abbr gca 'git commit --amend'
    abbr gcaa 'git commit --amend --author="Name <email>"'

    abbr gcl 'git clone'

    abbr gco 'git checkout'
    abbr gcom 'git checkout master'

    abbr gcp 'git cherry-pick'

    abbr gd 'git diff'
    abbr gd 'git diff'

    abbr gf 'git fetch'
    abbr gl 'git log'

    abbr gm 'git merge'
    abbr grb 'git rebase'

    abbr gp 'git push'
    abbr gpom 'git push origin master'
    abbr gpum 'git push upstream master'

    abbr gpl 'git pull'
    abbr gplr 'git pull --rebase'
    abbr gplum 'git pull upstream/master'
    abbr gplumr 'git pull upstream/master --rebase'

    abbr grsu 'git remote set-url'
    abbr grgu 'git remote get-url'
    abbr grsuo 'git remote set-url origin'
    abbr grguo 'git remote get-url origin'
    abbr grsuu 'git remote set-url upstream'
    abbr grguu 'git remote get-url upstream'

    abbr grh 'git reset --hard'
    abbr grhom 'git reset --hard origin/master'

    abbr gs 'git status'
    abbr gst 'git stash'

    # hub
    abbr hb 'hub browse'
    abbr hbi 'hub browse -- issues'
    abbr hco 'hub checkout'
    abbr hi 'hub issue'
    abbr hic 'hub issue create -m'
    abbr hcl 'hub clone'
    abbr hcr 'hub create'
    abbr hpr 'hub pull-request'
    abbr hrl 'hub release'

    # Python
    abbr p2 'python2'
    abbr p3 'python3'
    abbr p 'python3'

    abbr pi 'pip install'
    abbr piu 'pip install --upgrade'
    abbr piug 'pip install --upgrade'

    # apt
    abbr ai 'sudo apt install'
    abbr aug 'sudo apt upgrade'
    abbr aud 'sudo apt update'
    abbr ar 'sudo apt remove'
    abbr aar 'sudo apt autoremove'
    abbr as 'apt search'
    abbr asw 'apt show'

    # gui apps
    abbr n 'nautilus .'
    abbr e 'emacs .'
    abbr ec 'emacsclient . -c &'

    # cd to the last visited directory upon exiting ranger
    abbr r 'ranger --choosedir="/home/gdquest/.config/ranger/.rangerdir"; cd (cat /home/gdquest/.config/ranger/.rangerdir)'

    # cli programs
    abbr pq 'pngquant'

    abbr yt 'youtube-dl'
    abbr yta 'youtube-dl -x'
    abbr ytt 'youtube-dl --list-thumbnail'

    abbr f 'firefox'
    abbr fs 'firefox --search'
    abbr fsy 'firefox https://www.youtube.com/results\?search_query='

    # hugo
    abbr hnp 'hugo new post/2019/'
    abbr hn 'hugo new'
    abbr hs 'hugo server -D'
    abbr h 'hugo'

    # power sequencer
    abbr br 'bpsrender -w 6 *.blend && ffmpeg_compress_nvenc --delete *.mp4 && mv *.mp4 ~/Videos/youtube-exports/ && rm -rf bpsrender/'
    abbr brs 'bpsrender -w 6 -d *.blend && bpsrender *.blend -j'
    abbr brm 'bpsrender -m *.blend'
    abbr bp 'bpsproxy .'
    abbr bpnv 'bpsproxy . -p nvenc'

    abbr ffmpeg_remap_audio "ffmpeg -i video -i audio -map 0:v:0 -map 1:a:0 -c:v copy -c:a aac -b:a 320k introducing-docs.mp4"

    # internet
    abbr nwoff "nmcli networking off"
    abbr nwx "nmcli networking off"
    abbr nwon "nmcli radio wifi off"

    # gnome
    abbr gsq "gnome-session-quit"

    echo 'Done'
end
