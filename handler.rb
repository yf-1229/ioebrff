require "curses"
require "./edit"

class Handler
    def execute(wind, input_ch)
        case input_ch
        when ?B
            wind.cursor_down
        when ?A # カーソルを上に
            wind.cursor_up
        when ?D # カーソルを左に
            wind.cursor_left
        when ?C # カーソルを右に
            wind.cursor_right
        when ?q # プログラム終了
            raise "Finish Program"
        end
        return self
    end
end
