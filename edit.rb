require "curses"

class EditWind
    def initialize(wind)
        @window = wind.subwin(wind.maxy-4,wind.maxx,0,0)
        @window.scrollok(true)
    end
    
    def display(filename)
        @filename = filename
        begin
            @file = open(@filename, "a+")
            @data = []
            @file.each_line do |line|
                @data.push(line.chop) # 行末の改行を取り除く
            end
            # 0行目からウィンドウの最大行数まで一行ずつ表示する
            @data[0..(@window.maxy-1)].each_with_index do |line, idx|
                @window.setpos(idx, 0)
                @window.addstr(line)
            end
        rescue # Error Dialog
            raise IOError,"FILE OPEN ERROR: #{filename}"
        end
        @window.setpos(0, 0)
        @window.refresh
    end
    
    def getch
        return @window.getch
    end
end
                