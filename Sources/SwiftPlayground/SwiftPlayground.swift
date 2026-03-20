// The Swift Programming Language
// https://docs.swift.org/swift-book


/// Prints the board for the user to guess.
/// - Parameter board: The grid for the user to guess with. 
func printBoard(_ board: [[String]]) {
    var columnLabels = "  "
    for i in 0..<board.count {
        columnLabels = columnLabels + "\(i) "
    }
    print(columnLabels)
    
    for (index, row) in board.enumerated() {
        var rowString = "\(index) "
        for cell in row {
            rowString = rowString + cell + " "
        }
        print(rowString)
    }
}


/// Checks the guess to see if it hits, misses or is invalid.
/// - Parameters:
///     - row: The row the user has put.
///     - column: The column the user has put.
///     - ocean: The grid that contains the ship locations.
///     - guesses: The grid that tells the user their guesses.
/// - Returns: The updated guess board that displays if the user has hit or missed the ship.
func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]] {
    var updatedGuesses = guesses
    
    // Checks if the position is in the grid.
    guard row >= 0 && row < ocean.count && col >= 0 && col < ocean[0].count else {
        print("Invalid coordinates. Try again.")
        return guesses
    }
    
    // Checks if the position has been guessed.
    if guesses[row][col] == "X" || guesses[row][col] == "O" {
        print("You have already guessed this spot.")
        return guesses
    }
    
    // Compares the ocean and guess boards to see if it is a hit or a miss.
    if ocean[row][col] == "S" {
        print("Hit")
        updatedGuesses[row][col] = "X"
    } else {
        print("Miss")
        updatedGuesses[row][col] = "O"
    }
    
    return updatedGuesses
}

/// Checks and counts how many ships are left.
/// - Parameters:
///     - ocean: The board/grid that contains the ship locations.
///     - guesses: The board/grid that contains the users guesses.
/// - Returns: The amount of unsunk ships left.
func remainingShips(in ocean: [[String]], guesses: [[String]]) -> Int {
    var count = 0
    
    // Checks and counts how many ships left based on number of "S"
    for row in 0..<ocean.count {
        for col in 0..<ocean[row].count {
            if ocean[row][col] == "S" && guesses[row][col] != "X" {
                count += 1
            }
        }
    }
    
    return count
}

/// Places a ship at a random location on the board.
/// - Parameters:
///     - size: The size of the grid of the board.
///     - shipCount: The amount of ships being placed down.
/// - Returns: The ships placed down in the ocean board.
func randomShipPlacement(size: Int, shipCount: Int) -> [[String]] {
    var grid = Array(repeating: Array(repeating: "~", count: size), count: size)
    var shipsPlaced = 0
    
    // Picks a random row and column to place a ship and checks if it is unused.
    while shipsPlaced < shipCount {
        let row = Int.random(in: 0..<size)
        let col = Int.random(in: 0..<size)
        
        if grid[row][col] != "S" {
            grid[row][col] = "S"
            shipsPlaced += 1
        }
    }
    
    return grid
}

@main
struct SwiftPlayground {
    static func main() {

        // Manages size of the board.
        var size = 0

        var maxGuesses = 0
        var shipCount = 0

        while true {
            print("What size would you like the grid to be?")
            if let userInput = readLine(), let gridInput = Int(userInput) {
                size += gridInput
                break
            } else {
                print("Invalid option, please pick a number.")
            }
        }

        while true {
            print("How many ships do you want to place?")
            if let userInput = readLine(), let shipInput = Int(userInput), shipInput > 0 && shipInput <= size * size {
                shipCount += shipInput
                maxGuesses += shipInput + 4
                break 
            } else {
                print("Invalid option, must not exceed the size or be lower than 0.")
            }
        }

        // Contains the user's guesses and the locations of the ships.
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        ocean = randomShipPlacement(size: size, shipCount: shipCount)

        print("Initial Board:")
        printBoard(guesses)

        // Only allows the user to play an allocated amount of guesses.
        for turn in 1...maxGuesses {
            print("\nTurn \(turn)")
            
            print("Enter row:")
            // Confirms the row exists.
            guard let rowInput = readLine(), let row = Int(rowInput) else {
                print("Invalid input.")
                continue
            }
            
            print("Enter column:")
            // Confirms the column exists.
            guard let colInput = readLine(), let col = Int(colInput) else {
                print("Invalid input.")
                continue
            }
            
            guesses = processGuess(row: row, col: col, ocean: ocean, guesses: guesses)
            
            printBoard(guesses)
            
            let shipsLeft = remainingShips(in: ocean, guesses: guesses)
            print("Ships remaining: \(shipsLeft)")
            
            // Ends the game after all the ships have been destroyed
            if shipsLeft == 0 {
                print("You win!")
                break
            }
            // Prints an end message once the loop is over & the user lost.
            if turn == maxGuesses {
                print("Game over! Ships remaining: \(shipsLeft).")
            }
        }
    }
}
