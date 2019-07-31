function youtube_dl_add_to_list --description 'Add one or more URLs to the list of youtube videos and playlists to download'
    set URLS_FILE_PATH $HOME/Documents/youtube_dl_urls.txt
    string split " " $argv >> $URLS_FILE_PATH
end
