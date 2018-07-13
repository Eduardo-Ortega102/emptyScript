#!/bin/bash


function usage(){
	echo "Usage: $0 {<a parameter>} {<another parameter>}"
}

function dependencies() {
    let error=0
    [[ $(which xmlstarlet) == "" ]] && { error=1; echo "Missing Dependency: you need to install 'xmlstarlet'."; }
    [[ ${error} -ne 0 ]] && { exit 20; }
}

function confirm() {
    read -r -p "Do you want to continue? [y/N]: " response
    case "${response}" in
        [yY]) 
            true
            ;;
        [nN]) 
            false
            ;;
        *)
            echo "Invalid option..."
            confirm
            ;;
    esac
}

[[ "$#" -gt 2 ]] && { echo "Illegal number of parameters!"; usage; exit 1; }
dependencies
confirm || { echo "EXIT."; exit 2; }

echo "Start coding!!"

