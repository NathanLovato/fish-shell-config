function path_sanitize --description "Sanitizes a file name taking a path as input. Remove trailing whitespace from the basename, replaces whitespace and dashes with one dash, and makes it lowercase"
    set file (basename $argv)
    set directory (dirname $argv)
    set file_sanitized (echo $file | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sed 's/[[:space:]-]\+/-/g' | tr '[:upper:]' '[:lower:]')
    if [ $directory != "./" ]
        echo -n $directory/
    end
    echo $file_sanitized
end
