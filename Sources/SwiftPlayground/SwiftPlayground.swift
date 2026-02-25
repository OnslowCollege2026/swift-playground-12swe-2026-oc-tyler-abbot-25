// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let isLarge = false
    var note = ""

    if isLarge {
        // note = "Logan is a good person" // Declaring a new value doesn't change the value outside the scope. 
    } else {
        note = "Logan is a bad person." // Declaring a new value doesn't change the value outside the scope.
    }

print(note)
    }
}
