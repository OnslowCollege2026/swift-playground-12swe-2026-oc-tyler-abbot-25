// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Parameter:
/// - board: The 2D grid to display.
func printBoard(_ board: [[String]]) {
    print("  0 1 2 3 4 5")
    
    for (i, row) in board.enumerated() {
        var line = "\(i) "
        for cell in row {
            line += "\(cell) "
        }
        print(line)
    }
}

func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]] {
    var updatedGuesses = guesses
    
    // Checking if valid
    guard row >= 0 && row < ocean.count &&
            col >= 0 && col < ocean[0].count else {
        print("Invalid coordinates. Try again.")
        return guesses
    }
    
    // Checking if option is already guessed
    if guesses[row][col] == "X" || guesses[row][col] == "O" {
        print("You have already guessed this spot.")
        return guesses
    }
    
    // Hit or miss
    if ocean[row][col] == "S" {
        print("Hit")
        updatedGuesses[row][col] = "X"
    } else {
        print("Miss")
        updatedGuesses[row][col] = "O"
    }
    
    return updatedGuesses
}

func remainingShips(in ocean: [[String]], guesses: [[String]]) -> Int {
    var count = 0
    
    for row in 0..<ocean.count {
        for col in 0..<ocean[row].count {
            if ocean[row][col] == "S" && guesses[row][col] != "X" {
                count += 1
            }
        }
    }
    
    return count
}

func randomShipPlacement(size: Int, shipCount: Int) -> [[String]] {
    var grid = Array(repeating: Array(repeating: "~", count: size), count: size)
    var shipsPlaced = 0
    
    while shipsPlaced < shipCount {
        let row = Int.random(in: 0..<size)
        let col = Int.random(in: 0..<size)
        
        // Avoid overlap
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

        let size = 6
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        print("Initial Board:")
        printBoard(guesses)

        let maxTurns = 5

        ocean = randomShipPlacement(size: size, shipCount: 4)

        for turn in 1...maxTurns {
            print("\nTurn \(turn)")
            
            print("Enter row:")
            guard let rowInput = readLine(), let row = Int(rowInput) else {
                print("Invalid input.")
                continue
            }
            
            print("Enter column:")
            guard let colInput = readLine(), let col = Int(colInput) else {
                print("Invalid input.")
                continue
            }
            
            guesses = processGuess(row: row, col: col, ocean: ocean, guesses: guesses)
            
            printBoard(guesses)
            
            let shipsLeft = remainingShips(in: ocean, guesses: guesses)
            print("Ships remaining: \(shipsLeft)")
            
            if shipsLeft == 0 {
                print("You win!")
                break
            }
            
            if turn == maxTurns {
                print("Game over! Ships remaining: \(shipsLeft).")
            }
        }


    }
}
