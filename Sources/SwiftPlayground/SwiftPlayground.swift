// The Swift Programming Language
// https://docs.swift.org/swift-book
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

@main
struct SwiftPlayground {
    static func main() {
        // Function outputs that do not contain parameters.
        printRoomIntro()

        printDivider()
        print("Summary here")
        printDivider()

        printUnitsNote()

        printGoodbye()
    }
}
