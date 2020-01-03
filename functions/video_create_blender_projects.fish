function video_create_blender_projects --description 'Create one or more video editing projects with Blender'
    argparse --name=video_create_blender_projects --min-args 1 'd/date=' -- $argv
    or return

    set ERROR_MISSING_FOLDERS "You need to pass folder(s) to this function for it to work"
    for dir in $argv
        if not test -d $dir
            mkdir $dir
        end
    end

    set EXT_VIDEO mp4,flv,mov,mts,mkv,MP4,FLV,MOV,MTS,MKV
    set EXT_IMG png,jpg,gif
    set EXT_AUDIO wav,mp3,aac,flac

    set blender_template_file $HOME/Templates/video.blend
    set blender_python_file $HOME/.config/fish/functions/video_create_blender_projects.py

    echo "Creating directories and moving files"
    set start_folder (pwd)
    for dir in $argv
        cd $dir

        set blend_file_path $dir.blend
        echo "Creating blend file" $blend_file_path
        cp $blender_template_file $blend_file_path

        mkdir video audio img
        for file in *.{(echo $EXT_VIDEO)}
            mv $file video/$file
        end
        for file in *.{(echo $EXT_IMG)}
            mv $file img/$file
        end
        for file in *.{(echo $EXT_AUDIO)}
            mv $file audio/$file
        end

        if test -f $blender_python_file
            blender $blend_file_path -b -P $blender_python_file
        end

        cd $start_folder
    end
end
