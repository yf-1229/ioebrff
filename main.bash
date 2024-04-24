#! /bin/bash

RUBY_SCRIPT=""

main_menu() {
  choice=$(whiptail --title "ioebrff" --menu "How can I help today?" 15 60 4 \
    "1" "Edit File" \
    "2" "Save File" \
    "3" "Run Code" \
    "4" "Terminal" \
    "5" "Document" \
    3>&1 1>&2 2>&3)

  case $choice in
    1) edit_file ;;
    2) save_file ;;
    3) run_code ;; # Ruby Only
    4) Terminal ;;
    5) Document ;;
    *) echo "Invailid option" ;;
  esac 
}

edit_file() {
  filename=$(whiptail --title "Edit File" --inputbox "Enter File Path:" 10 60 3>&1 1>&2 2>&3)
  
  # ファイルが存在するか確認
  if [ -f "$filename" ]; then
    export filename
    screen ruby main.rb
  else
    filename=$(whiptail --title "Edit File" --inputbox "Enter File Path:" 10 60 3>&1 1>&2 2>&3)
    export filename
    screen ruby main.rb
  fi
  
  main_menu
}

main_menu