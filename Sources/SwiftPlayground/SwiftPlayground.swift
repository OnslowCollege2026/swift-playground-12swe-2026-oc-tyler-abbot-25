// The Swift Programming Language
// https://docs.swift.org/swift-book

// START COMMENTING, FIX THE PROBLEM WHERE IT STILL SELLS BAGS DESPITE NOT WANTING KUMARA.

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

    if kumaraAdded < kumaraWeight, kumaraAdded + kumaraStock > maximumWeight {
        print("Invalid amount, you can only add between 0.1 and 50kgs of kumara.")
        return 0
    } else { 
        let newKumuraStock = kumaraAdded + kumaraStock
        print("Added \(kumaraAdded)kgs of kumara to the stock.")
        return newKumuraStock
    }
}

func buyKumara(kumaraStock: Double, amount:Double) -> Double {
    if amount >= 0.1 && amount <= kumaraStock {
        let newKumaraStock = kumaraStock - amount
        print("Sold \(amount)kg/s of kumara. You now have \(newKumaraStock)kg/s of kumara left.")
        return amount 
    } else if amount < 0.1 || amount > kumaraStock {
        print("Invalid amount, you can only buy between 0.1kgs and \(kumaraStock)kgs.")
        return 0
    } else {
        print("Invalid input, must be a number or decimal.")
        return 0
    }
}

func costs(kumaraStock: Double, amount:Double, bagsUsed:Double) -> Double {
    let bagPrice: Double = 0.2
    let pricePerKg: Double = 3.0

    if amount >= 0.1 && amount <= kumaraStock && bagsUsed >= 1 {
        let price = (amount * pricePerKg) + (bagPrice * bagsUsed)
        print("Total Price: \(price)")
        return price
    } else {
        return 0
    }
}

func bagsUsed(amount: Double, kumaraStock: Double, numberOfBags: Double) -> Double {
    let maximumBags:Double = 5000
    let maximumWeight:Double = 5.0
    var amountLeft:Double = amount
    var bagsUsed:Double = 0.0

    if amount >= 0.1 && amount <= kumaraStock && numberOfBags < maximumBags {
        bagsUsed += 1

        while amountLeft > maximumBags {
            bagsUsed += 1
            amountLeft -= maximumWeight
        }

        return bagsUsed
    } else {
        return 0
    }
}

@main
struct SwiftPlayground {
    static func main() {

        /// Boundaries and prices for calculations.
        let maxStockWeight: Double = 50.0

        /// Keeps track of stock and sold counts to update inside functions.
        var stockInKg: Double = 0.0
        var totalUsedBags: Double = 0.0
        var kumaraWeightSold: Double = 0.0

        /// Holds information for the previous sales records.
        var numberOfBags: [Double] = []
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
                    // Adds so that it can be used for calculations whilst also appending for the sales records.
                    kumaraWeightSold += buyKumara(kumaraStock: stockInKg, amount: amount)
                    stockInKg -= kumaraWeightSold
                    weightSoldRecords.append(kumaraWeightSold)

                    // Adds bags used so that it can calculate the total cost and add it to the records.
                    costsRecord.append(costs(kumaraStock: stockInKg, amount: amount, bagsUsed: bagsUsed(amount: amount, kumaraStock: stockInKg, 
                    numberOfBags: totalUsedBags)))

                    // Appends for the sales records that will be used in case 4.
                    numberOfBags.append(bagsUsed(amount: amount, kumaraStock: stockInKg, numberOfBags: totalUsedBags))
                    totalUsedBags += bagsUsed(amount: amount, kumaraStock: stockInKg, numberOfBags: totalUsedBags)

                }

            case 3:
                print("You have \(stockInKg)kg of kumara left.")

            case 4:
                let salesRecords = Array(zip(weightSoldRecords, costsRecord))
                salesRecords.forEach { record in
                    print("\(record.0)kgs: $\(record.1)")
                }

            case 5:
                print("Exiting programme, have a good day.")
                running = false

            default:
                print("Invalid input, you must select between 1 and 5.")
            }
        }
    }
}
