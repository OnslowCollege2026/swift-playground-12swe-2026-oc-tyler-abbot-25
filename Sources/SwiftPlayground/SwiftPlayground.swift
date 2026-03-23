// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        // Constants and variables.
        /// The vocabulary to test the user on.
        /// Each array contains the English word, the correct answer in the language and three wrong answers. 
        let vocabulary = [
            ["Hello.",              "Hola", "Y tu", "Bueno", "Decir"],
            ["Goodbye",  "Adios", "Hola", "Buenos dias", "Necessito"],
            ["Please",     "Por Favor", "Hola", "Adios", "Lo siento"],
            ["Thanks", "Gracias", "Lo siento", "Mi opinion", "Hacer"],
            ["My name is",   "Me llamo", "Hola","Por favor", "Bueno"]
        ]

        /// The indices of the questions that the user got wrong.
        var incorrectIndices: [Int] = []

        /// The number of questions that the user got wrong first time around.
        var incorrectCount = 0

        /// The number of questions the user got right.
        var correctCount = 0 
        // Loop until all vocab questions asked. 
        while correctCount == vocabulary.count {
            // Show the question

            // Present the possible answer

            // Check if the user got the correct answer.
            // If not, take not and ask later. 
        }

        // Show the question.

        // Present the possible answers.

        // Check if the user guessed correctly.
        // If not, make a note of the question to ask again later.
    }
}
