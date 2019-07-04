function youtube_dl_all --description 'Download all urls from a file passed as an argument'
    set default_path $HOME'/.config/fish/functions/data/youtube_dl_url_list.txt'
    set urls_file_path ''
    if test -e (echo $argv)
        set urls_file_path $argv
    else
        set urls_file_path $default_path
    end

    if not [ $urls_file_path ]
        echo 'Missing source file to download from'
        return
    end

    set youtube_urls
    for i in (cat $default_path)
        set youtube_urls $youtube_urls $i
    end

    set remaining_urls
    for i in $youtube_urls
        if not youtube-dl $i
            set remaining_urls $remaining_urls $i
        end
    end

    echo $remaining_urls > $urls_file_path
    echo "Some videos weren't downloaded:" $remaining_urls
end
