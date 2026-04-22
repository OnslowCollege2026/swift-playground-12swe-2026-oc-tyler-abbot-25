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

        /// Used for calculating costs.
        let bagCost:Double = 0.2
        let costPerKg:Double = 3.0
        let kumuraWeight:Double = 0.1

        /// Lower and upper boundaries 
        let maximumKumuraStock:Double = 50.0

        /// Keeps track of stock and sold counts to update inside functions.
        var stockInKg:Double = 0.0
        var kumuraWeightSold:Double = 0.0

        
    }
}
