require "curses"
require "io/console"
require "./edit"
require "./hud"
require "./handler"

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
# イベント操作
handler = Handler.new

edit.display(filename)

begin
    while (key = STDIN.getch) != "\C-c"
        if key == "\e" && STDIN.getch == "["
            key = STDIN.getch
        end
        ch = case key
              when "A", "k", "w", "\u0010"; "A" #↑
              when "B", "j", "s", "\u000E"; "B" #↓
              when "C", "l", "d", "\u0006"; "C" #→
              when "D", "h", "a", "\u0002"; "D" #←
            else nil
            end

        handler = handler.execute(edit, ch)
    end
end

 ################
#コンソール画面を終了
Curses.close_screen