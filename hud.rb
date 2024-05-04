require "curses"

class Hud
    def initialize(wind,filename="")
        max_y = wind.maxy
        max_x = wind.maxx
        begin_y = wind.maxy - 4
        wind.setpos(begin_y,0)
        wind.standout   # 文字表示を反転色にする
        wind.addstr(" " * max_x)
        # wind.standend
        # ファイル名を表示
        wind.setpos(begin_y,(max_x/2)-(filename.length/2))
        wind.addstr(filename)
        # メニュー
        
        