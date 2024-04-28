require "curses"
require "./editwindow"

filename = ENV['FILENAME_IOEBRFF']

Curses.init_screen
Curses.cbreak
Curses.noecho

# Base window
base_window = Curses.stdscr
# Edit Window
edit_window = EditWindow.new(base_window)

# Open file
edit_window.display(filename)
edit_window.getch

Curses.close_screen

