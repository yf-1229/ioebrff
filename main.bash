#! /bin/bash

RUBY_SCRIPT=""

main_menu() {
  choice=$(whiptail --title "ioebrff" --menu "How can I help today?" 15 60 4 \
    "1" "Edit File" \
    "2" "Save File" \
    "3" "Document" \
    "4" "Run Code" \
    "5" "EXIT" \
    3>&1 1>&2 2>&3)

  case $choice in
    1) edit_file ;;
    2) save_file ;;
    3) document ;;
    4) run_code ;;
    5) exit ;;
    *) echo "Invailid option" ;;
  esac 
}

edit_file() {
  filename=$(whiptail --title "Edit File" --inputbox "Enter File Path:" 10 60 3>&1 1>&2 2>&3)

  if [ -f "$filename" ]; then
    export filename
    screen ruby main.rb
  else
    whiptail --title "Error" --msgbox "File not found: $filename" 10 60
  fi
  
  main_menu
}

main_menu