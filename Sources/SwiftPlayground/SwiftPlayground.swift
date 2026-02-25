// The Swift Programming Language
// https://docs.swift.org/swift-book
func menuChoice() -> Int {

    while true {
        print("""
        ==== Egg Shop ====
        1. Add eggs
        2. Sell eggs
        3. Show current stock
        4. Show total eggs sold
        5. Exit
        Choose an option:
        """)

    if let input = readLine(), let choice = Int(input) {
        return choice
    } else {
        return 0 
    }
    }
}

/// Adds eggs to the stock and checks if the stock is above its capacity. 
/// - Parameters
///     - Current stock: The amount of eggs the user has.
///     - Amount: The amount of eggs that the user is adding.
/// - Return: The updated stock with the amount of eggs added. 
func addEggs(currentStock: Int, amount: Int) -> Int {
    if amount < 1 {
        print("Invalid: Must have at least one or more eggs.")
        return currentStock
    }

    if currentStock + amount > 1000 {
        print("Invalid: Stock must not exceed 1000 eggs.")
        return currentStock
    }

    let newStock = currentStock + amount
    print("Added \(amount) of eggs.")
    return newStock
}

/// Sells eggs and checks if the amount sold is lower than 1 or above the amount of stock. 
/// - Parameters:
///     - Current stock: The amount of eggs the user has. 
///     - Amount: The amount of eggs the user is selling. 
/// - Return: The amount of eggs the user sold and the updated stock amount. 
func sellEggs(currentStock: Int, amount: Int) -> Int? {
    if amount < 1 {
        print("Invalid: The amount must at least be 1 egg.")
        return nil 
    }

    if amount > currentStock {
        print("Invalid: The amount you are trying to sell is higher than the available stock.")
        return nil
    }
    let newStock = currentStock - amount
    print("Sold \(amount) eggs.")
    return newStock
}

/// Updates the amount of eggs that are sold. 
/// - Parameters:
///     - Current sold: The amount of eggs that are already sold.
///     - Amount: The amount of eggs that have just been sold. 
/// - Return: The added total amount of eggs sold. 
func updateSoldCount(currentSold: Int, amount: Int) -> Int {
    let newTotal = currentSold + amount
    return newTotal
}

/// Informs the user how much stock they have left. 
/// - Parameter stock: The amount of eggs the user has. 
/// - Return: The stock in a string variant. 
func stockMessage(stock: Int) -> String {
    let stockMessage = "You have \(stock) eggs left."
    return stockMessage
}

/// Gives the user a summary of how many eggs were sold and the remaining eggs.
/// - Parameters:
///     - stock: The amount of eggs the user has.
///     - soldEggs: The amount of eggs the user sold. 
/// - Return: The amount of eggs the user still has and sold in a string. 
func dailySummary(stock: Int, soldEggs: Int) -> String {
    let dailySummary = """
    === Exiting  Shop ====
    Eggs left in stock: \(stock)
    Eggs sold today: \(soldEggs)

    Goodbye!
    """

    return dailySummary
}

@main
struct SwiftPlayGround {
    static func main() {
    
    // Measures how many eggs are in stock.
    var eggsInStock:Int = 0
    // Measures how many eggs are sold.
    var eggsSold:Int = 0
    // Used in order to keep the main loop running. 
    var running:Bool = true

    while running {
        let choice = menuChoice()
        
        // Switch allows for the option to be selected quickly and easily. 
        switch choice {

            // Checks and uses functions to calculate how many eggs are added to the stock / variable. 
            case 1:
                print("How many eggs would you like to add?")
                if let input = readLine(), let amount = Int(input) {
                    eggsInStock = addEggs(currentStock: eggsInStock, amount: amount)
                }

            // Checks and uses functions to calculate how many eggs the user would like to sell and updates that in the different functions/variables for safe-keeping. 
            case 2:
                print("How many eggs would you like to sell?")
                if let input = readLine(), let amount = Int(input) {
                    if let newStock = sellEggs(currentStock: eggsInStock, amount: amount) {
                        eggsInStock = newStock 
                        eggsSold = updateSoldCount(currentSold: eggsSold, amount: amount)
                    }
                }

            // Informs the user how much stock is left. 
            case 3:
                print(stockMessage(stock: eggsInStock))

            // Informs the user how many eggs have been sold. 
            case 4:
                print("Total sold eggs: \(eggsSold)")

            // Allows the user to exit the loop and informs them of the final statistics - eggs sold and eggs left in stock. 
            case 5:
                print(dailySummary(stock: eggsInStock, soldEggs: eggsSold))
                running = false 

            // Ensures no invalid options break the switch. 
            default:
                print("Invalid option, only choose options 1 to 5.")
        }
    }

    }
}
