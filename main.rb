require "curses"

#ファイル名をコマンドライン引数として受け取る
if ARGV.size != 1
    #コマンドライン引数がない場合
    printf("Command line arguments required")
else
    filename = ARGV[0]
end

Curses.init_screen
Curses.cbreak
Curses.noecho

wind = Curses.stdscr
edit = EditWind.new(wind)
hud = Hud.new(wind, filename)



