function get_country_code --description "Enter a country's name and the program outputs the corresponding country code"
    set code (grep -i $argv $HOME/.config/fish/functions/data/country_codes.csv | cut -d, -f2)
    echo $code | xclip -selection clipboard
    echo "$code" was copied to the clipboard
end
