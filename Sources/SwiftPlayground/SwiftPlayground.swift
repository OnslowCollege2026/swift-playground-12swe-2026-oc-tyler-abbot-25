// The Swift Programming Language
// https://docs.swift.org/swift-book
func print(board: [[String]]) {
    board.forEach { line in
        print("\(line[0]) | \(line[1]) | \(line[2])")
        print("--+---+--")
    }
    print()
}

func askForPosition (board: [[String]]) -> [Int] {
    let game = true
    while game {
    
    print("Please enter the row number (1-3): ")
    let userInput = readLine()!
    let rowNumber = Int(userInput)! - 1

    print("Please enter the column number (1-3): ")
    let userInput2 = readLine()!
    let columnNumber = Int(userInput2)! - 1

    if board[rowNumber][columnNumber] == "." {
        return [rowNumber, columnNumber]
    } else {
        print("Game over.")
        
    }
    }
}

@main
struct SwiftPlayground {
    static func main() {
        var player = "X"

        var board = [
            [".", ".", "."],
            [".", ".", "."],
            [".", ".", "."],
        ]
        print(board: board)

        while true {
        // Ask for the user's move.
        let position = askForPosition(board: board)
        board[position[0]][position[1]] = player

        if player == "O" {
            player = "X"
        } else {
            player = "O"
        }

        print(board: board)
        
        }
    }
}
