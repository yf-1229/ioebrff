require "curses"

class EditWindow
    def initialize(window)
        @window = window.subwin(window.maxy-3,window.maxx,0,0)
        # Allow Scroll
        @window.scrollok(true)
    end
    
    def display(filename)
        @filename = filename
        begin
            @file = open(@filename, "a+")
            @data = []
            @file.each_line do |line|
                @data.push(line.chop)
            end
            # 初期表示、一行ずつ表示する
            @data[0..(@window.maxy-1)].each_with_index do |line, idx|
                @window.setpos(idx, 0)
                @window.addstr(line)
            end
        rescue
            raise IOError, "FILE OPEN ERROR: #{filename}"
        end
        @window.setpos(0, 0)
        @window.refresh
    end
    
    def getch
        return @window.getch
    end
end
            
        
        