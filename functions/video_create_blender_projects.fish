function video_create_blender_projects --description ''
    set ERROR_MISSING_FOLDERS "You need to pass folder(s) to this function for it to work"

    set folders_list (filter_folders $argv)
    if [ $folders_list ]
        echo $ERROR_MISSING_FOLDERS
        return
    end

    set EXT_VIDEO mp4,mov,mts,mkv,MP4,MOV,MTS,MKV
    set EXT_IMG png,jpg,gif
    set EXT_AUDIO wav,mp3,aac,flac

    set blender_template_file $HOME/Templates/video.blend
    set blender_python_file $HOME/.config/fish/functions/blender_import_footage.py

    for dir in $folders_list:
        set new_name $dir/$dir.blend
        echo "Creating blend file" $new_name
        cp $blender_template_file $new_name

        echo "Creating directories and moving files"
        mkdir $dir/video $dir/audio $dir/img
        for file in $dir/*.{(echo $EXT_VIDEO)}
            mv $dir/$file $dir/video/$file
        end
        for file in $dir/*.{(echo $EXT_IMG)}
            mv $dir/$file $dir/img/$file
        end
        for file in $dir/*.{(echo $EXT_AUDIO)}
            mv $dir/$file $dir/audio/$file
        end
        blender $dir/$dir.blend -b -P $blender_python_file
    end
end
