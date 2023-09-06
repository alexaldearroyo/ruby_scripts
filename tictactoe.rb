class Board
  def initialize
    # Initialize a 3x3 grid filled with spaces
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def display
    # Display the current state of the board
    @grid.each do |row|
      puts row.join("|")
      puts "-----"
    end
  end

  def place_piece(row, col, piece)
    # Place the given piece (X or O) on the board at the specified row and column
    @grid[row][col] = piece
  end

  def cell_occupied?(row, col)
    # Check if the cell at the given row and column is already occupied
    @grid[row][col] != " "
  end

  def victory?
    # Check if there's a winning condition on the board
    (0..2).each do |i|
      # Check rows
      return true if @grid[i][0] == @grid[i][1] && @grid[i][1] == @grid[i][2] && @grid[i][0] != " "
      # Check columns
      return true if @grid[0][i] == @grid[1][i] && @grid[1][i] == @grid[2][i] && @grid[0][i] != " "
    end

    # Check main diagonal
    return true if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2] && @grid[0][0] != " "
    # Check secondary diagonal
    return true if @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0] && @grid[0][2] != " "

    false
  end
end

class TicTacToe
  def initialize
    # Initialize the board and set the current player to X
    @board = Board.new
    @current_player = "X"
  end

  def play
    # Loop through the 9 possible moves
    9.times do
      @board.display

      row, col = get_player_move
      @board.place_piece(row, col, @current_player)

      # Check for a winner after every move
      if @board.victory?
        @board.display
        puts "Player #{@current_player} wins!"
        return
      end

      # Switch players for the next turn
      switch_player
    end

    @board.display
    puts "It's a tie!"
  end

  def get_player_move
    loop do
      # Prompt the current player for their move
      print "Player #{@current_player}, enter your move (1-9): "
      move = gets.to_i

      # Validate the input
      if move < 1 || move > 9
        puts "Invalid input. Number out of range."
        next
      end

      # Convert the move number to a row and column
      row, col = (move - 1) / 3, (move - 1) % 3

      # Check if the selected cell is already occupied
      if @board.cell_occupied?(row, col)
        puts "Cell already occupied!"
        next
      end

      return [row, col]
    end
  end

  def switch_player
    # Switch the current player (X <-> O)
    @current_player = @current_player == "X" ? "O" : "X"
  end
end

# Start the game
game = TicTacToe.new
game.play
