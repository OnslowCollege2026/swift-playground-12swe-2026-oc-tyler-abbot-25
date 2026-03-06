// The Swift Programming Language
// https://docs.swift.org/swift-book
// Task B ------------------------------------------------------------------

/// Counts how many items are in the table array. 
/// - Parameters: 
///     - Table: The array that has the items.
/// - Return: The amount of items in the array as an integer.
func totalPrinted(of table: [[Int]]) -> Int {
    var printed = 0
    for row in table {
        for _ in row {
            printed += 1
        }
    }
    return printed
}

// Task C ------------------------------------------------------------------

/// This function adds the numbers in each column index together.
/// - Parameters:
///     - table: the number in the table.
///     - columnIndex: the index of the column you want to add.
/// - Return: The total of the column depending on the index.

func columnTotal(table: [[Int]], columnIndex: Int) -> Int {
    var sum = 0
    for row in table {
        if columnIndex >= 0 && columnIndex < row.count {
            sum += row[columnIndex]
        }
    }
    return sum
}

// Task D ------------------------------------------------------------------

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
struct SwitPlayground {
    static func main() {

// Task A ------------------------------------------------------------------

        let temperatures = [
            [24,19,22,16],
            [19,22,23,15],
            [14,19,12,9]
        ]

        print(temperatures[0])
        print(temperatures[1][2])
        print(temperatures[2][0])

        let secondRow = temperatures[1]
        var average = 0
        for value in secondRow {
            average += value
        }

        average /= 4
        print(average)

// Task B ------------------------------------------------------------------

    let tabley = [
        [2, 4, 6],
        [8, 10, 12],
        [14, 16, 18]
    ]

    print(tabley)
    print(totalPrinted(of: tabley))

// Task C ------------------------------------------------------------------

    // Contains values to add.
    let table = [
        [3, 5, 7, 9],
        [2, 4],
        [8, 6, 1],
        [10]
    ]

    // Testing the different indexes. 
    print(columnTotal(table: table, columnIndex: 0))
    print(columnTotal(table: table, columnIndex: 1))
    print(columnTotal(table: table, columnIndex: 2))
    print(columnTotal(table: table, columnIndex: 3))
    

// Task D ------------------------------------------------------------------

    
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
