// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Prints a menu for a user to pick what option they want to do.
/// - Returns: An integer that represents what option the user picked. 
func stallMenuChoice() -> Int {

    while true {
        print(
            """
            === Roadside Kumara Stall ===
            What would you like to do?

            1. Add kumara to the stock
            2. Buy a bag of kumara
            3. Look at how much stock is left
            4. Look at the sales records
            5. Look at the average kumara purchased per sale  
            6. Exit
            """)

        if let userInput = readLine(), let choice = Int(userInput) {
            return choice
        } else {
            return 0
        }
    }
}

/// Adds an amount the user asks to the stock and caps it at 50kgs.
/// - Parameters:
///     - maximumWeight: The most ammount of kilograms the boxes can hold (50kgs).
///     - kumaraAdded: The amount of kumara in Kgs that the user is trying to add.
///     - kumaraStock: The current stock.
/// - Returns: The new amount of stock that the user has added to it.
func addKumaraKg(maximumWeight: Double, kumaraAdded: Double, kumaraStock: Double) -> Double {
    let kumaraWeight: Double = 0.1

    if kumaraAdded < kumaraWeight || kumaraAdded + kumaraStock > maximumWeight {
        print("Invalid amount, you can only add between 0.1 and 50kgs of kumara.")
        return 0
    } else { 
        let newKumuraStock = kumaraAdded + kumaraStock
        print("Added \(kumaraAdded)kgs of kumara to the stock.")
        return newKumuraStock
    }
}

/// Calculates the new stock amount after the user buys some kumara.
/// - Parameters:
///     - kumaraStock: The current stock.
///     - amount: The amount the user is buying.
/// - Returns: The new amount of stock.
func buyKumara(kumaraStock: Double, amount:Double) -> Double {
    if amount >= 0.1 && amount <= kumaraStock {
    let newKumaraStock = kumaraStock - amount
    print("Sold \(amount)kg/s of kumara. You now have \(newKumaraStock)kg/s of kumara left.")
    return newKumaraStock 
    } else {
        return 0
    }
}

func costs(kumaraStock: Double, amount:Double, bagsUsed:Double) -> Double {
    let bagPrice: Double = 0.2
    let pricePerKg: Double = 3.0

    let price = (amount * pricePerKg) + (bagPrice * bagsUsed)
    print("Total Price: \(price)")
    return price
}

func bagsUsed(amount: Double, numberOfBags: Double) -> Double {
    let maximumBags:Double = 5000
    let maximumWeight:Double = 5.0
    var amountLeft:Double = amount
    var bagsUsed:Double = 1.0

if numberOfBags >= maximumBags {
    print("We're sold out of bags, you'll have to carry them..")
    return 0
}

    while amountLeft > maximumWeight {
        bagsUsed += 1
        amountLeft -= maximumWeight
    }

    return bagsUsed

}

@main
struct SwiftPlayground {
    static func main() {

        /// Boundaries and prices for calculations.
        let maxStockWeight: Double = 50.0
        let singleKumaraWeight: Double = 0.1

        /// Keeps track of stock and sold counts to update inside functions.
        var stockInKg: Double = 0.0
        var totalUsedBags: Double = 0.0
        var kumaraWeightSold: Double = 0.0
        var kumaraPerBag: Double = 0.0

        /// Holds information for the previous sales records.
        var costsRecord: [Double] = []
        var weightSoldRecords: [Double] = []
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
                    if amount >= singleKumaraWeight && amount <= stockInKg {
                        stockInKg = buyKumara(kumaraStock: stockInKg, amount: amount)
                        kumaraWeightSold += amount
                        totalUsedBags += bagsUsed(amount: amount, numberOfBags: totalUsedBags)
                        weightSoldRecords.append(amount)
                        costsRecord.append(costs(kumaraStock: stockInKg, amount: amount, bagsUsed: bagsUsed(amount: amount, numberOfBags: totalUsedBags)))
                    } else {
                        print("Invalid amount, must be between \(singleKumaraWeight) and \(stockInKg)kgs.")
                    }
                } else {
                    print("Invalid input, must  be a number or a decimal.")
                }

            case 3:
                print("You have \(stockInKg)kg of kumara left.")

            case 4:
                let salesRecords = Array(zip(weightSoldRecords, costsRecord))
                salesRecords.forEach { record in
                    print("\(record.0)kgs: $\(record.1)")
                }

            case 5:
                kumaraPerBag = kumaraWeightSold / totalUsedBags

                print("""
                Average Sales Calculator:
                In total, people have bought \(kumaraWeightSold)kgs of kumara.
                In total, people have used \(totalUsedBags) bags.

                On average, each bag should contain: \(kumaraPerBag)kgs of kumara in them.
                """)

            case 6:
                print("Exiting programme, have a good day!")
                running = false

            default:
                print("Invalid input, you must select between 1 and 6.")
            }
        }
    }
}
