// The Swift Programming Language
// https://docs.swift.org/swift-book

/*

1. The paragraph/slide below contains some code that contains some errors, which your testing will help detect.

    2. The program asks for guests at a wedding, how much they contributed as a gift, and then ranks them on a tier list. The more money they give, the higher the tier.

    3. Lowest tier is F, then D, then C, then B, then A, then top tier is S.

    4. Use the testing table in Google Classroom to record your testing of the program. Note any errors and what you think went wrong, then fix the errors. Keep adding new lines showing testing of that part of the program until it is fixed.

    5. For **Kaiaka/M** and **Kairangi/E**, you need to ensure boundaries are handled correctly (both top and bottom, where applicable, inside and out) and invalid values (such as `nil`) don't cause the program to crash.
Code to test and debug

*/
@main
struct SwiftPlayground {
    static func main() {
        
        let rankLabels = ["F Tier", "D Tier", "C Tier", "B Tier", "A Tier", "S Tier"]

        func rankIndex(from amount: Double) -> Int {
            if amount >= 250 { return 5 } 
            if amount >= 100 { return 4 } 
            if amount >= 50  { return 3 }
            if amount >= 25  { return 2 }
            if amount >= 10  { return 1 }
            return 0 
        }

        func addPreMadeGuests(to guestList: inout [[String]]) {
            // Pre-made guests to help you test.
            guestList.append(["Rich Richard", "500.0"])
            guestList.append(["Broke Bob", "2.0"])
        }

        func printTierList(_ guestList: [[String]]) {
            print("\n--- BROKEN PARTY TIER LIST ---")

            let sortedList = guestList.sorted { lhs, rhs in
                let lhsAmount = Double(lhs[1]) ?? 0
                let rhsAmount = Double(rhs[1]) ?? 0
                let lhsRank = rankIndex(from: lhsAmount)
                let rhsRank = rankIndex(from: rhsAmount)

                if lhsRank != rhsRank {
                    return lhsRank > rhsRank
                }

                return lhs[0] > rhs[0]
            }

            for guest in sortedList {
                let amount = Double(guest[1]) ?? 0
                let rank = rankLabels[rankIndex(from: amount)]
                print("[\(rank)] \(guest[0]) | $\(guest[1])")
            }
        }

        var guestList: [[String]] = []
        addPreMadeGuests(to: &guestList)
        var isRunning = true

        while isRunning {
            print("\nEnter Name (or 'done'): ", terminator: "")
            let nameInput = readLine()!

            if nameInput.lowercased() == "done" {
                isRunning = false
                break
            }

            print("Enter Amount: ", terminator: "")
            if let userInput = readLine(), let amountInput = Double(userInput), amountInput >= 0 {
                let amount = Double(amountInput)
                guestList.append([nameInput, String(amount)])
                print("Added \(nameInput).")
            } else {
                print("Invalid input, must be at least 0 or above.")
            }

        }

        printTierList(guestList)
    }
}
