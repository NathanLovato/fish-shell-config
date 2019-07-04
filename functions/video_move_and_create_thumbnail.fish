# Functions to manage videos
function video_move_and_create_thumbnail --description 'Move the video to the youtube-exports folder, create a copy of the Youtube thumbnail template, and open it in Krita'
    set krita_thumbnail_template $HOME/Templates/thumbnail-youtube.kra
    set youtube_export_folder $HOME/Videos/youtube-exports
    for file in $argv
        if not test -f $file
            echo $file "is not a valid file"
            continue
        end
        set video_name (basename $file | cut -d '.' -f 1)
        set out_path $youtube_export_folder/$video_name.kra
        if test -f $youtube_export_folder/$file
            echo "File" $file "already exists in" $youtube_export_folder
            continue
        else
            mv $file $youtube_export_folder
            echo "Copied file" $file "to" $youtube_export_folder
        end
        if test -f $out_path
            echo "File" $out_path "already exists"
            continue
        else
            echo "Creating thumbnail file" $krita_thumbnail_template "in" $out_path
            cp $krita_thumbnail_template $out_path
            krita $out_path
        end
    end
end
