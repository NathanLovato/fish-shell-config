function name_sanitize --description "Removes surrounding whitespace from a string, replaces whitespace with one dash"
    echo $argv | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sed 's/[[:space:]]\+/-/g' | tr '[:upper:]' '[:lower:]'
end
