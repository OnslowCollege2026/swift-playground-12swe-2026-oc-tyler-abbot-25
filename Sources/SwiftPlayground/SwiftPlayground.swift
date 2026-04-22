// The Swift Programming Language
// https://docs.swift.org/swift-book


func stallMenuChoice() -> Int {
    
    while true {
        print("""
        === Roadside Kumara Stall ===
        What would you like to do?

        1. Add kumura to the stock
        2. Buy a bag of kumura
        3. Look at how much stock is left
        4. Find out how many are sold
        5. Leave
        """)

        if let userInput = readLine(), let choice = Int(userInput) {
            return choice
        } else {
            return 0
        }
    }
}

@main
struct SwiftPlayground {
    static func main() {
        print("Hello, world!")
    }
}
