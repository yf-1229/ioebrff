require "./edit"

class Handler
    def execute(wind, ch)
        case ch
        when ?B # カーソルを下に
            wind.cursor_down
        when ?A # カーソルを上に
            wind.cursor_up
        when ?a # カーソルを左に
            wind.cursor_left
        when ?D # カーソルを右に
            wind.cursor_right
        when ?H # カーソルを行頭に
            wind.cursor_top
        when ?F # カーソルを行末に
            wind.cursor_bottom
        when ?q # プログラム終了
            raise "Finish Program"
        end
        return self
    end
end
