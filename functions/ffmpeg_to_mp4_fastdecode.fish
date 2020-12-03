function ffmpeg_to_mp4_fastdecode --description "Transcodes input files to editing-friendly H264/MP4 files"
    argparse --name=ffmpeg_to_mp4_fastdecode --min-args 1 'd/delete' 'n/noaudio' "o/output-path=" -- $argv
    or return

    if test $_flag_output_path -a ! -d $_flag_output_path
        mkdir -p $_flag_output_path
    end

    for f in $argv
        set directory (dirname $f)
        set file (basename $f)
        set name (string split -m 1 -r '.' $file)[1]
        set extension (string split --right --max 1 . $f)[-1]

        test $_flag_output_path && set out_file_path $_flag_output_path/
        set out_file_path $out_file_path"(string replace $extension .mp4 $f)"

        set command ffmpeg -hide_banner -i $f

        if [ $_flag_noaudio ]
            set command $command -an
        else
            set command $command -c:a copy
        end
        set command $command -crf 17 -tune fastdecode -r 29.97 -g 1 -preset veryfast -y $out_file_path
        # echo $command
        # if [ $_flag_delete ]
        #     rm $f
        # end
    end
end

complete -c ffmpeg_to_mp4_fastdecode -s d -l delete
