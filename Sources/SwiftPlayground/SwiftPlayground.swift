// The Swift Programming Language
// https://docs.swift.org/swift-book

func printBoard(_ board: [[String]]) {
    
}

@main
struct SwiftPlayground {
    static func main() {
        let size = 6
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)


        while true {
            print("Where would you like to guess?")
            print(ocean)
        }

    }
}
