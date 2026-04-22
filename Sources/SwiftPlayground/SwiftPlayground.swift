// The Swift Programming Language
// https://docs.swift.org/swift-book


/*
Students will develop a Swift program for a roadside kumara stall.

    The stall keeps kumara in a large container, with stock measured in kilograms. Customers pull up to the side of the road, take a bag from a stack available, fill up the bags, then weigh the bags, find out how much to pay, and then put the money into a box or scan it into an EFTPOS machine.

    The owner wants to find out how many kumara people are buying per bag so that they can transition to selling kumara pre-bagged for a set price. To do this, they will use the average data from the sales recorded during the run of the program; the calculation goes kumara weight sold / number of bags used = how much kumara to put in each bag

The program must allow the roadside stall owner to:

    add kumara stock to the container in kilograms
    view the current stock remaining in kilograms
    view previous sales records
    show summary information for the stall owner, including the average weight sold per bag and the average amount earned per bag

The program must allow customers to:

    record a sale by entering the total weight sold and the number of bags used
    kumara are charged at $3 per kilogram
    each bag costs 20 cents
    the least amount of kumara one can purchase is a single kumara at 100 grams
    the most amount of kumara one can purchase is the entire remaining stock, however much it is — but they must be put into bags which can hold, at most, 5 kg each

calculate and display the kumara charge, bag charge, and total charge for the sale
reduce the available stock when a sale is completed
*/

func stallMenuChoice() -> Int {
    print("""
    
    """)
}

@main
struct SwiftPlayground {
    static func main() {
        print("Hello, world!")
    }
}
