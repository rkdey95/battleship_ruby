class Board
  
def initialize(n)
@grid = Array.new(n){Array.new(n){:N}}
@size = n*n
end

def size
@size
end

def[](arr)
@grid[arr[0]][arr[1]]
end

def[]=(pos,val)
@grid[pos[0]][pos[1]] = val
end

def num_ships
    count = 0
@grid.each do |e|
    e.each do |ee|
        if ee== :S
        count +=1
        end
    end
end
return count
end

def attack(pos)
if self[pos] == :S
    self[pos] = :H
    p "'you sunk my battleship!'"
    return true
else
    self[pos] = :X
    return false
end
end

def place_random_ships
repeater = self.size*0.25
store_pos = []
pos = [rand(@grid.length),rand(@grid.length)]
repeater.ceil.times do |i|
while store_pos.include?(pos)
    pos = [rand(@grid.length),rand(@grid.length)]
end
store_pos << pos
self[pos] = :S
end
end

def hidden_ships_grid
length = @grid.length
new_grid = Array.new(length){Array.new(length){:N}}

@grid.each_with_index do |e,i|
    e.each_with_index do |ee,ii|
        if ee==:X
            new_grid[i][ii] = :X
        end
        if ee==:H
            new_grid[i][ii] = :H
        end
    end
end
return new_grid
end

def self.print_grid(arr)
    arr.each do |e|
        print e.join(' ')
        print("\n")
    end
end

def cheat()
    Board.print_grid(@grid)
end

def print
    Board.print_grid(hidden_ships_grid)
end


end

