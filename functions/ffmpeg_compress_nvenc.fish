function ffmpeg_compress_nvenc --description "Compresses video files passed as arguments using h264_nvenc"
    argparse --name=ffmpeg_compress_nvenc --min-args 1 'd/delete' -- $argv
    or return

    set file_list (filter_files --extensions "mp4 mov mkv" -- $argv)
    if not [ $file_list ]
        echo "None of the file paths exists, cancelling"
        return
    end

    for f in $file_list
        set directory (dirname $f)
        set file (basename $f)
        set name (string split -m 1 -r '.' $file)[1]
        ffmpeg -i $f -c:a copy -c:v h264_nvenc -preset slow -qp 20 $directory/$name-compressed.mp4
        if [ $_flag_delete ]
            rm $f
        end
    end
end
