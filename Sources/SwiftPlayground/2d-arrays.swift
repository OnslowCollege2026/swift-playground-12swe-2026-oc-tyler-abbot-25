// Task B ------------------------------------------------------------------

/// Counts how many items are in the table array. 
/// - Parameters: 
///     - Table: The array that has the items.
/// - Return: The amount of items in the array as an integer.
func totalPrinted(of table: [[Int]]) -> Int {
    var printed = 0
    for row in table {
        for value in row {
            printed += 1
        }
    }
    return printed
}

struct twodimensionarrays {
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

        let table = [
            [2, 4, 6],
            [8, 10, 12],
            [14, 16, 18]
        ]

        print(table)
        print(totalPrinted(of: table))
    }
}
