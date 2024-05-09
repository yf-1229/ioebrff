require "curses"
require "./edit"

class Handler
    def execute(wind, input_ch)
        case input_ch
        when ?k
            wind.cursor_down
        when ?i # カーソルを上に
            wind.cursor_up
        when ?j # カーソルを左に
            wind.cursor_left
        when ?l # カーソルを右に
            wind.cursor_right
#        when ?H # カーソルを行頭に
#            wind.cursor_top
#        when ?F # カーソルを行末に
#            wind.cursor_bottom
        when ?q # プログラム終了
            raise "Finish Program"
        end
        return self
    end
end
