function video_create_blender_projects --description 'Create one or more video editing projects with Blender'
    argparse --name=video_create_blender_projects h/help o/open p/render-proxies -- $argv
    or return

    test $_flag_help && video_create_blender_projects_help && return
    test -z $argv && echo "You need to pass folder(s) to this function for it to work." && return

    set EXT_VIDEO mp4,flv,mov,mts,mkv,MP4,FLV,MOV,MTS,MKV
    set EXT_IMG png,jpg,gif
    set EXT_AUDIO wav,mp3,aac,flac

    set BLENDER_TEMPLATE_FILE $HOME/Templates/video.blend
    set BLENDER_ASSETS $HOME/Videos/assets/assets

    for arg in $argv
        set dir (realpath $arg)
        set existing_file (find $dir -maxdepth 1 -type f -iname '*.blend')
        count $existing_file >/dev/null && echo "Found existing blender file '"(basename $existing_file)"' in '$arg': skipping directory." && continue

        set project_name (basename $dir)
        test $project_name = "." && set project_name (basename (pwd))
        set blend_file_path $dir/$project_name.blend

        cp -v $BLENDER_TEMPLATE_FILE $blend_file_path

        mkdir -p $dir/footage

        set files $dir/*.{(echo $EXT_VIDEO),(echo $EXT_IMG),(echo $EXT_AUDIO)}
        count $files >/dev/null && mv -v $files $dir/footage

        # Generate proxies
        test $_flag_p && bpsproxy -p nvenc -s 25 -- $dir
        cp --recursive $BLENDER_ASSETS $dir

        test $_flag_open && blender $blend_file_path &
    end
end

function video_create_blender_projects_help
    echo "Create one or more video editing projects with Blender.
    For each input directory, moves all the footage files it contains into subdirectories, copies
    the template blend file to the directory, and renames it.

    Usage:
    video_create_blender_projects [OPTIONS] -- directory_1 directory_2 ...

    Options:
    -h/--help            -- Show this help information.
    -o/--open            -- Open the projects in blender.
    -p/--render-proxies  -- Render proxies with bpsproxy.
    "
end

complete -c video_create_blender_projects -s h -l help -d "Print usage information"
complete -c video_create_blender_projects -s o -l open -d "Open each newly created project in Blender"
complete -c video_create_blender_projects -s p -l render-proxies -d "Render proxies for each project with bpsproxy"
