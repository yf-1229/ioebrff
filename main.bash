#! /bin/bash

RUBY_SCRIPT=""

main_menu() {
    choice=$(whiptail --title "ioebrff" --menu "How can I help today?" 15 60 4 \
        "1" "Open File" \
        "2" "Terminal" \
        "3" "Document" \
        "4" "EXIT" \
        3>&1 1>&2 2>&3)

    case $choice in
        1) open_file ;;
        2) terminal ;;
        3) Document ;;
        4) exit ;;
        *) echo "Invailid option" ;;
    esac
}

open_file() {
    filename=$(whiptail --title "Open File" --inputbox "Enter File Path:" 10 60 3>&1 1>&2 2>&3)

    if [ -f "$filename" ]; then
        export filename
        screen ruby main.rb
    else
        main_menu
    fi

    main_menu
}

main_menu