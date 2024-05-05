require "curses"
require "./edit"
require "./hud"

#filename=ENV['filename']

#ファイル名をコマンドライン引数として受け取る
if ARGV.size != 1
    #コマンドライン引数がない場合
    printf("usage: fe file_name\n");
    exit
else
    filename = ARGV[0]
end

Curses.init_screen
Curses.cbreak
Curses.noecho

#　ベースウィンドウ
wind = Curses.stdscr
# 編集エリア
edit = EditWind.new(wind)
# 情報表示エリア
hud = Hud.new(wind, filename)

edit.display(filename)
edit.getch

#コンソール画面を終了
Curses.close_screen