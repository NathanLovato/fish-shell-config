function video_youtube_livestream --description 'Start the programs to set up or work on a livestream'
    set LIVE_PLAYLIST "$HOME/Music/Thaehan/livestream.xspf"
    open $LIVE_PLAYLIST
    if [ $argv ]
        firefox (echo "https://www.youtube.com/livestreaming/dashboard?v=" $argv)
    else
        firefox "https://www.youtube.com/livestreaming/"
    end
    obs
end
