function image_website_resize_banner --description "Resizes and compresses one or more images to use as a banner on the website, using imagemagick and pngquant"
    set width 800
    for i in $argv
        set directory (dirname $i)

        set string_split (string split --max 1 --right "." (basename $i))
        set name $string_split[1]
        set extension $string_split[2]

        set filepath_out $directory/$name-$width"w."$extension
        convert $i -resize 800 -sharpen 0.3 $filepath_out
        pngquant $filepath_out

        set processed_image_path (string replace -- ".$extension" "-fs8."$extension $filepath_out)
        mv $processed_image_path $filepath_out
    end
end
