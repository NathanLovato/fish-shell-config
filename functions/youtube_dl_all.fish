#!/usr/bin/env fish

function youtube_dl_all --description 'Download all urls from a file passed as an argument'
    argparse --name=youtube_dl_all 'h/help' 'a/audio' 'f/format=' -- $argv
    or return

    set file_url_list $HOME/.config/fish/functions/data/youtube_dl_urls.txt
    if not [ $file_url_list ]
        echo 'Missing source file to download from'
        return
    end

    set temp (mktemp)
    set urls (string split " " (cat $file_url_list))
    for i in $urls
        if [ $_flag_audio ]
            youtube-dl -f 250 $i
        else if [ $_flag_format ]
            youtube-dl --format $_flag_f $i
        else
            youtube-dl $i
        end
        # if not [ $status -eq 0 ]
        #     echo "There was an error downloading this video: $i"
        #     echo $i >> $temp
        # end
        echo $i > $temp
    end

    set remaining_count (math (count $urls) - (count ($cat $temp)))
    if [ $remaining_count -gt 0 ]
        cat $temp > $file_url_list
        echo "Some videos weren't downloaded:" (cat $file_url_list)
    end
end

complete -c youtube_dl_all -s h -l help
complete -c youtube_dl_all -s a -l audio
complete -c youtube_dl_all -s f -l format
