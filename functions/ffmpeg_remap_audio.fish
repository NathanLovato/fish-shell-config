function ffmpeg_remap_audio --description "Compresses video files passed as arguments using h264_nvenc"
    argparse --name=ffmpeg_remap_audio --min-args 2 --max-args 2 'v/video' 'a/audio' -- $argv
    or return

    if [ $_flag_video ]
        set video $_flag_video
    else
        set video (filter_files --extensions "mp4 mov mkv flv" -- $argv)[0]
    end

    if [ $_flag_audio ]
        set audio $_flag_audio
    else
        set audio (filter_files --extensions "flac mp3 wav ogg" -- $argv)[0]
    end

    if not [ $audio ] or not [ $video ]
        echo "Missing audio or video file"
        return
    end

    set directory (dirname $f)
    set file (basename $f)
    set name (string split -m 1 -r '.' $file)[1]
    ffmpeg -i $video -i $audio -map 0:v:0 -map 1:a:0 -c:v copy -c:a aac -b:a 320k $directory/$name-audio-remapped.mp4
end
complete -c ffmpeg_remap_audio -s v -l video
complete -c ffmpeg_remap_audio -s a -l audio
