class Board
  
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def size
        @size
    end

    def [](arr)
        return @grid[arr[0]][arr[1]]
    end

    def []=(pos, v)
        @grid[pos[0]][pos[1]] = v
        # self[pos] = v
    end

    def num_ships
        @grid.flatten.count {|place| place == :S}
    end

    # Part Two

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        while self.num_ships < (size * 0.25)        # works with self.size, @size, and size
            row = rand(0...@grid.length)  
            col = rand(0...@grid.length)     
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele| 
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end

        # hidden_mat = []
        # i = 0
        # while i < @grid.length do 
        #     j = 0
        #     sub_arr = []
        #     while j < @grid.length do
        #         if @grid[i][j] == :S
        #             sub_arr << :N
        #         else
        #             sub_arr << @grid[i][j]
        #         end
        #         j += 1
        #     end
        #     hidden_mat << sub_arr
        #     i += 1
        # end
        # hidden_mat
    end

    def self.print_grid(arr)
        arr.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
