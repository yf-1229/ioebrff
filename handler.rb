require "curses"
require "./edit"

class Handler
    def execute(wind, input_ch)
        case input_ch
        when ?A
            wind.cursor_up
        when ?B
            wind.cursor_down
        when ?C
            wind.cursor_right
        when ?D
            wind.cursor_left
        end
        return self
    end
end
