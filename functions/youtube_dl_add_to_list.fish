function youtube_dl_add_to_list --description 'Add one or more URLs to the list of youtube videos and playlists to download'
    set URLS_FILE_PATH $HOME'/.config/fish/functions/data/youtube_dl_url_list.txt'
    string split " " $argv >> $URLS_FILE_PATH
end
