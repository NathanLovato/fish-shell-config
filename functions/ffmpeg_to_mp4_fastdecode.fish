function ffmpeg_to_mp4_fastdecode --description "Transcodes input files to editing-friendly H264/MP4 files"
    argparse --name=ffmpeg_to_mp4_fastdecode --min-args 1 'd/delete' -- $argv
    or return

    set file_list (filter_files --extensions "mp4 mov mkv flv" -- $argv)
    if not [ $file_list ]
        echo "None of the file paths exists, cancelling"
        return
    end

    for f in $file_list
        set directory (dirname $f)
        set file (basename $f)
        set name (string split -m 1 -r '.' $file)[1]
        ffmpeg -hide_banner -y -i $f -c:a copy -crf 15 -g 1 -tune fastdecode $directory/$name.edit.mp4
        if [ $_flag_delete ]
            rm $f
        end
    end
end

complete -c ffmpeg_to_mp4_fastdecode -s d -l delete
