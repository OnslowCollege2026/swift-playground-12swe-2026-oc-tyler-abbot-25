// The Swift Programming Language
// https://docs.swift.org/swift-book

func stallMenuChoice() -> Int {

    while true {
        print(
            """
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
    let kumaraWeight: Double = 0.1

    if kumaraAdded < kumaraWeight {
        print("Invalid amount, you must add at least 0.1kg of kumura.")
        return 0
    }

    if kumaraAdded + kumaraStock > maximumWeight {
        print("Invalid amount, you will exceed the maximum weight of 50 kilograms.")
        return 0
    }

    let newKumuraStock = kumaraAdded + kumaraStock
    print("Added \(kumaraAdded)kgs of kumara to the stock.")
    return newKumuraStock
}

func buyKumara(kumaraStock: Double, amount:Double) -> Double {

    if amount < 0.1 {
        print("Invalid amount, you have to buy at least 0.1kg of kumara.")
        return 0
    }

    if amount > kumaraStock {
        print("Invalid amount, we don't have that much kumara.")
        return 0
    }

    let newKumuraStock = kumaraStock - amount
    print("Sold \(amount)kgs of kumara. There is now \(newKumuraStock)kgs of kumara left.")
    return newKumuraStock
}

// FIX THIS
func costPerSale(kumaraStock:Double, amount:Double) -> Double {
    let bagCosts: Double = 0.2
    let costPerKg: Double = 3.0
    let maxBagWeight:Double = 5.0

    var bagCount:Double = 1.0

    if amount < 0.1 {
        return 0
    }

    if amount > kumaraStock {
        return 0
    }

    while amount > maxBagWeight {
        bagCount += 1
    }

    let totalCosts = (amount * costPerKg) + (bagCosts * bagCount)
    print("Total Price: $\(totalCosts).")
    return totalCosts
}

@main
struct SwiftPlayground {
    static func main() {

        /// Lower and upper boundaries
        let maxStockWeight: Double = 50.0

        /// Keeps track of stock and sold counts to update inside functions.
        var stockInKg: Double = 0.0
        var salesRecords: [Double] = []
        var kumaraWeightSold: Double = 0.0
        /// Used to keep the loop running until the user decides to exit.
        var running: Bool = true

        while running {
            let choice = stallMenuChoice()

            switch choice {
            case 1:
                print("How many kilograms of kumara would you like to add?")
                if let userInput = readLine(), let amount = Double(userInput) {
                    stockInKg = addKumaraKg(
                        maximumWeight: maxStockWeight, kumaraAdded: amount, kumaraStock: stockInKg)
                } else {
                    print("Invalid input, please only use whole and decimal numbers.")
                }

            case 2:
                print("How many kilograms of kumara would you like to buy?")
                if let userInput = readLine(), let amount = Double(userInput) {
                    kumaraWeightSold += buyKumara(kumaraStock: stockInKg, amount: amount)
                    // FIX THIS 
                    salesRecords.append(costPerSale(kumaraStock: stockInKg, amount: amount))
                }

            case 3:
                print("You have \(stockInKg)kg of kumara left.")

            case 4:
                // START ON THIS
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
