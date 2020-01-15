function youtube_dl_add_to_list --description 'Add one or more URLs to the list of youtube videos and playlists to download'
    for arg in $argv
        echo $arg >> $HOME/.config/fish/functions/data/youtube_dl_urls.txt
    end
end
