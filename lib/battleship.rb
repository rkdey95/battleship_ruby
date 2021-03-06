require_relative "board"
require_relative "player"

class Battleship

def initialize(n)
@player = Player.new
@board = Board.new(n)
@remaining_misses = (n*n)/2
end

def board
@board
end

def player 
@player
 end

 def start_game
@board.place_random_ships
puts (@board.num_ships)
@board.print
 end

 def lose?
if @remaining_misses <=0
    print('you lose\n')
    return true
else
    return false
 end
end

def win?
if @board.num_ships <=0
    print('you win\n')
    return true
else return false
end
end

def game_over?
 if self.win? ==  true || self.lose? == true
    return true
 else return false
 end
end

def turn
if @board.attack(@player.get_move) == false
    @remaining_misses  -=1
end
print @remaining_misses
print("\n")
@board.print



end




end
