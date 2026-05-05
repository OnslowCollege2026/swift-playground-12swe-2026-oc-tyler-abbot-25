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
///     - singleKumaraWeight: Represents the weight of a single kumara.
/// - Returns: The amount of stock being added to be added on to the current stock levels.
func addKumaraKg(maximumWeight: Double, kumaraAdded: Double, kumaraStock: Double, singleKumaraWeight: Double) -> Double {

    if kumaraAdded >= singleKumaraWeight && kumaraAdded + kumaraStock <= maximumWeight {
        print("Added \(kumaraAdded)kg/s of kumara to the stock.")
        return kumaraAdded
    } else {
        print("Invalid, please check if your stock levels are full or if you are adding at least \(singleKumaraWeight)kgs of kumara to the stock.")
        return 0
    }
}

/// Calculates the new stock amount after the user buys some kumara.
/// - Parameters:
///     - kumaraStock: The current stock.
///     - amount: The amount the user is buying.
///     - singleKumaraWeight: Represents the weight of a single kumara.
/// - Returns: The new amount of stock.
func buyKumara(kumaraStock: Double, amount: Double, singleKumaraWeight: Double) -> Double {
    let newKumaraStock = kumaraStock - amount
    print("Sold \(amount)kg/s of kumara. You now have \(newKumaraStock)kg/s of kumarleft.")
    return newKumaraStock 
}

/// Calculates how much the order is with the bag price included.
/// - Parameters:
///     - amount: How many kgs of kumara the user is buying.
///     - bagsUsed: How many bags are being used for the order.
/// - Returns: The total price of the order. 
func costs(amount:Double, bagsUsed:Double) -> Double {
    let bagPrice: Double = 0.2
    let pricePerKg: Double = 3.0

    let price = (amount * pricePerKg) + (bagPrice * bagsUsed)
    print("Total Price: \(price)")
    return price
}

/// Calculates how many bags are being used for the order and checks if we're out of bags.
/// - Paramters:
///     - amount: How many kgs of kumara the user us buying.
///     - numberOfBags: How many bags have already been used.
/// - Returns: How many bags are being used in the order.
func bagsUsed(amount: Double, numberOfBags: Double) -> Double {
    let maximumBags:Double = 5000
    let maximumWeight:Double = 5.0
    var amountLeft:Double = amount
    var bagsUsed:Double = 1.0

if numberOfBags >= maximumBags {
    print("We're sold out of bags, you'll have to carry them..")
    return 0
}

    // Loops until the amount the user has is less than the maximum bag weight so that the proper amount of baags can be utilised.
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

            // Switch so that it is much easier to detect invalid inputs.
            switch choice {
            case 1:
                // Asks the user and adds that amount of stock after going through a function to check that it isn't invalid or will break the rules.
                print("How many kilograms of kumara would you like to add?")
                if let userInput = readLine(), let amount = Double(userInput) {
                    stockInKg += addKumaraKg(maximumWeight: maxStockWeight, kumaraAdded: amount, kumaraStock: stockInKg, singleKumaraWeight: singleKumaraWeight)
                } else {
                    print("Invalid input, please only use whole and decimal numbers.")
                }

            case 2:
                print("How many kilograms of kumara would you like to buy?")
                if let userInput = readLine(), let amount = Double(userInput) {
                    if amount >= singleKumaraWeight && amount <= stockInKg {

                        // Keeps track of how much is being sold as welll as the total usage and amount so that the average can be calculated later on.
                        stockInKg = buyKumara(kumaraStock: stockInKg, amount: amount, singleKumaraWeight: singleKumaraWeight)
                        kumaraWeightSold += amount
                        totalUsedBags += bagsUsed(amount: amount, numberOfBags: totalUsedBags)

                        // Appends so that it can be used in sales records later.
                        weightSoldRecords.append(amount)
                        costsRecord.append(costs(amount: amount, bagsUsed: bagsUsed(amount: amount, numberOfBags: totalUsedBags)))
                    } else {
                        print("Invalid amount, must be between \(singleKumaraWeight) and \(stockInKg)kgs.")
                    }
                } else {
                    print("Invalid input, must  be a number or a decimal.")
                }

            case 3:
                print("You have \(stockInKg)kg of kumara left.")

            case 4:
                // Places the weight sold and cost records into a zip so that it can be printed and displayed next to each other.
                let salesRecords = Array(zip(weightSoldRecords, costsRecord))
                salesRecords.forEach { record in
                    print("\(record.0)kgs: $\(record.1)")
                }

            case 5:
                // Updates here instead of being a constant so that it saves and can be changed later on if more sales happen.
                kumaraPerBag = kumaraWeightSold / totalUsedBags

                print("""
                Average Sales Calculator:
                In total, people have bought \(kumaraWeightSold)kgs of kumara.
                In total, people have used \(totalUsedBags) bags.

                On average, each bag should contain: \(kumaraPerBag)kgs of kumara in them.
                """)

            case 6:
                // Exiting message and stops the loop.
                print("""
                Thank you for using our kumara shop!

                Total Weight Sold: \(kumaraWeightSold)kgs
                Total Bags Used: \(totalUsedBags)
                """)
                running = false

            default:
                print("Invalid input, you must select between 1 and 6.")
            }
        }
    }
}
