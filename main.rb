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
    while (key = IO.console.getch) != "\C-c"
        if key == "\e" && (second_key = IO.console.getch) == "["
            direction = IO.console.getch
            ch = case direction
                    when "A"; "A" #↑
                    when "B"; "B" #↓
                    when "C"; "C" #→
                    when "D"; "D" #←
                    else nil
                end
            handler = handler.execute(edit, ch) if ch
        end
    end
end

#コンソール画面を終了
Curses.close_screen