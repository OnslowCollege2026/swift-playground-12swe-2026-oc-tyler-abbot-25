
// Functions WITHOUT parameters

/// Prints an introduction to a room calculator.
func printRoomIntro() {
    print("This program calculates room area and volume.")
    print("It also finds the usable space after furniture.")
}

/// Prints a divider line for output sections.
func printDivider() {
    print("------------")
}

/// Prints a unit note for users to understand what measurements are being used.
func printUnitsNote() {
    print("All measurements are in metres.")
}

/// Prints a goodbye message 
func printGoodbye() {
    print("Done. Thanks for using the calculator.")
}

// Functions WITH parameters -------------------------------------------------------------------------------------------

func printArea(length: Double, width: Double) -> Double {
    return length * width
}

func printVolume (length: Double, width: Double, height: Double) -> Double {
    return length * width * height
}

// Documenting functions -----------------------------------------------------------------------------------------------

/// Calculates the area of a room. 
/// - Parameters:
///     - Length: The room length in metres.
///     - Width: The room width in metres.
/// - Return: The area in square metres.
func roomArea(length: Double, width: Double) -> Double {
    return length * width
}

/// Calculates the volume of a room.
/// - Parameters: 
///     - Length: The room length in metres.
///     - Width: The room width in metres.
/// - Return: The area in square metres.
func roomVolume(length: Double, width: Double, height: Double) -> Double {
    return length * width * height
}

/// Checks if a room is small. 
/// - Parameters: 
///     - Volume: The room volume in metres cubed.
/// - Returns: True if the room is small. 
func isRoomSmall(volume: Double) -> Bool {
    return volume < 60
}

/// Reduces the height with a multiplier using a defined reduction percent.
/// - Parameters:
///     - Original: Original height in metres.
///     - Reduction percent: The percent the height is reduced by.
///     - Multiplier: Multiplies the reduction percent by 100 and dividing it in order to complete the calculations.
/// - Return: The reduced height in metres. 
func reducedHeight(original: Double, reductionPercent: Double) -> Double {
    let multiplier = (100.0 - reductionPercent) / 100.0
    return original * multiplier
}

struct functions {
    static func main() {
        // Function outputs that do not contain parameters.
        printRoomIntro()

        printDivider()
        print("Summary here")
        printDivider()

        printUnitsNote()

        printGoodbye()

        // Function outputs that DO contain parameters.
        print(printArea(length: 6.0, width: 2.5), "m²")
        print(printVolume(length: 6.0, width: 2.5, height: 2.3), "m³")
    }
}

