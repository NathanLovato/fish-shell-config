#!/usr/bin/env fish

function image_compress_and_overwrite --description "Compress and overwrite png files with pngquant"
    argparse --name=image_compress_and_overwrite 'h/help' -- $argv
    or return

    if [ $_flag_help ]
        echo "Compress and overwrite png files with pngquant
        Usage:
        image_compress_and_overwrite -- png_files
        "
        return
    end

    set extensions "png"
    set file_list (filter_files $argv --extensions $extensions)

    set total (count $file_list)
    set count 0
    for file in $file_list
        set filename (basename $file)
        set dirname (dirname $file)

        set name (string split --right --max 1 "." $filename)[1]
        set extension (string split --right --max 1 "." $filename)[-1]

        set out_file_path $dirname/$name-fs8.$extension
        pngquant $file
        mv $out_file_path $file
        if [ $total >1 ]
            set count (math $count + 1)
            echo -ne "Progress:  $count/$total\r"
        end
    end
    echo "Compressed $total images."
end
