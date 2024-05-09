require "curses"

class EditWind
    def initialize(wind)
        @window = wind.subwin(wind.maxy-3,wind.maxx,0,0)
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
        @cursor_y = 0
        @cursor_x = 0
        @top_statement = 0
        @window.setpos(@cursor_y, @cursor_x)
        @window.refresh
    end
    
    def getch
        return @window.getch
    end

    # カーソル操作
    def cursor_down # カーソルを下へ
        if @cursor_y >= (@window.maxy-1)
            scroll_down
        elsif @cursor_y >= (@data.length-1)
            @cursor_y += 1
        else
            @cursor_y += 1
        end
        if @cursor_x >= (@data[@cursor_y + @top_statement ].length)
            @cursor_x = @data[@cursor_y + @top_statement ].length
        end
        @window.setpos(@cursor_y, @cursor_x)
        @window.refresh
    end

    def cursor_up # カーソルを上へ移動
        if @cursor_y <= 0
            scroll_up
        else
            @cursor_y -= 1
        end
        if @cursor_x >= (@data[@cursor_y + @top_statement].length)
            @cursor_x = @data[@cursor_y + @top_statement].length
        end
        @window.setpos(@cursor_y,@cursor_x)
        @window.refresh
    end

    def cursor_left # カーソルを左へ移動
        unless @cursor_x <= 0
            @cursor_x -= 1
        end
        @window.setpos(@cursor_y, @cursor_x)
        @window.refresh
    end

    def cursor_right # カーソルを右へ移動
        unless @cursor_x >= (@data[@cursor_y + @top_statement].length)
            @cursor_x += 1
        end
        @window.setpos(@cursor_y, @cursor_x)
        @window.refresh
    end

    def scroll_up # 上へスクロール
        if( @top_statement > 0)
            @window.scrl(-1)
            @top_statement -= 1
            # 空いた場所にデータを一行表示
            str = @data[@top_statement]
            if ( str )
                @window.setpos(0, 0)
                @window.addstr(str)
            end
        end
    end

    def scroll_down # 下へスクロール
        if( @top_statement + @window.maxy < @data.length )
            #（表示されている文字は上へずれる）
            @window.scrl(1)
            # 上へずれて空いたスペースにデータを表示
            str = @data[@top_statement + @window.maxy]
            if ( str )
                @window.setpos(@window.maxy - 1, 0)
                @window.addstr(str)
            end
            @top_statement += 1
        end
    end
end
                