// The Swift Programming Language
// https://docs.swift.org/swift-book


/// Finds the largest number inside of an array.
/// - Parameter table: The table that contains the values.
/// - Return: The largest number in the array.
func maxValue(in table: [[Double]]) -> Double? {
    guard let firstRow = table.first, let initialMax = firstRow.first else {
        return nil
    }

    var maxNumber = initialMax
    for row in table {
        for value in row {
            if value > maxNumber {
                maxNumber = value
            }
        }
    }

    return maxNumber
}

@main
struct SwiftPlayground {
    static func main() {
    
    // Contains values to check for largest.
    let readings = [
        [1.5, 3.2, 2.8],
        [7.1],
        [4.4, 6.0],
        [5.9, 8.3, 0.7, 2.2]
    ]

    // Checks and prints if the function found a largest number or not. 
    if let largestNumber = maxValue(in: readings) {
        print(largestNumber)
    } else {
        print("The array is empty.")
    }
    }
}
