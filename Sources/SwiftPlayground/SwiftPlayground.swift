// The Swift Programming Language
// https://docs.swift.org/swift-book


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

@main
struct SwiftPlayground {
    static func main() {
        print(printArea(length: 6.0, width: 2.5), "m²")
        
        print(printVolume(length: 6.0, width: 2.5, height: 2.3), "m³")
    }
}
