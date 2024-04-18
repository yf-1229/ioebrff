require "curses"

Curses.init_screen
begin
  s = "Welcome to ioebrff World!"
  Curses.setpos(Curses.lines / 2, Curses.cols / 2 - (s.length / 2))
  Curses.addstr(s)
  Curses.refresh
end
