class Player

def get_move() 
    print("'enter a position with coordinates separated with a space like `4 7`'")
    print("\n")
    coordinates = gets.chomp
    print("\n")
    coordinates = coordinates.split
    coordinates.map {|e|e.to_i}
    end
    
end



