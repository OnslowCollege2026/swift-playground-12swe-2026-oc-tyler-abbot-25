// The Swift Programming Language
// https://docs.swift.org/swift-book


func stallMenuChoice() -> Int {

    while true {
        print("""
        === Roadside Kumara Stall ===
        What would you like to do?

        1. Add kumara to the stock
        2. Buy a bag of kumara
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

func addKumaraKg(maximumWeight: Double, kumaraAdded: Double, kumaraStock: Double) -> Double {
    if kumaraAdded < 0.1 {
        print("Invalid amount, you must add at least 100g or 0.1kg of kumura.")
        return 0
    }

    if kumaraAdded + kumaraStock > maximumWeight {
        print("Invalid amount, you will exceed the maximum weight of 50 kilograms.")
        return 0
    }

    let newKumuraStock = kumaraAdded + kumaraStock
    return newKumuraStock
}

@main
struct SwiftPlayground {
    static func main() {

        /// Used for calculating costs.
        let bagCost:Double = 0.2
        let costPerKg:Double = 3.0
        let kumaraWeight:Double = 0.1

        /// Lower and upper boundaries 
        let maxStockWeight:Double = 50.0

        /// Keeps track of stock and sold counts to update inside functions.
        var stockInKg:Double = 0.0
        var kumaraWeightSold:Double = 0.0
        /// Used to keep the loop running until the user decides to exit.
        var running:Bool = true

        while running {
            let choice = stallMenuChoice()

            switch choice {
                case 1:
                    print("How many kilograms of kumara would you like to add?")
                    if let userInput = readLine(), let amount = Double(userInput) {
                        stockInKg = addKumaraKg(maximumWeight: maxStockWeight, kumaraAdded: amount, kumaraStock: stockInKg)
                        print("Added \(amount)kgs of kumara to stock.")
                    }
                    

                case 2:
                    print("How many kilograms of kumara would you like to buy?")

                case 3:
                    print("You have \(stockInKg)kg of kumara left.")

                case 4:
                    print("Test")

                case 5:
                    print("Exiting programme, have a good day.")
                    running = false

                default:
                    print("Invalid input, you must select between 1 and 5.")
            }
        }
        
    }
}
