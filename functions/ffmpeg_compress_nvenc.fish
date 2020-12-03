

function ffmpeg_compress_mp4_nvenc --description "Compresses video files passed as arguments using h264_nvenc"
    argparse --name=ffmpeg_compress_nvenc --min-args 1 'i/inplace' -- $argv
    or return

    set file_list (filter_files --extensions "mp4 mov mkv flv" -- $argv)
    if not [ $file_list ]
        echo "None of the file paths exists, cancelling."
        return
    end

    for f in $file_list
        set directory (dirname $f)
        set file (basename $f)
        set extension (string split --right --max 1 . $file)[-1]
        set out_path $directory/$name-compressed.mp4

        ffmpeg  -threads auto -hwaccel auto -i $f \
            -c:v h264_nvenc -b:v 4M -maxrate:v 5M -bufsize:v 8M -profile:v main \
            -level:v 4.1 -rc:v vbr_hq -rc-lookahead:v 20 -spatial_aq:v 1 \
            -aq-strength:v 15 -coder:v cabac \
            -f mp4 $out_path

        [ $_flag_inplace ] && mv $out_path $i
    end
end
