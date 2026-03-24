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
        while correctCount <= vocabulary.count {
            let correctAnswer = vocabulary[correctCount][1]
            var options = Array(vocabulary[correctCount][0])

            // Show the question
            print("What is the word \(vocabulary[correctCount][0]) in spanish?")
            for (index, option) in options.enumerated() {
                print("\(index + 1). \(option)")
            }
            print("Enter your answer: ")

            if let userInput = readLine() {
                if let userAnswer = Int(userInput), userAnswer > 0, userAnswer <= 5 {
                    if options[userAnswer - 1] == correctAnswer {
                        print("That is correct. ")
                        correctCount += 1
                    } else {
                        print("That is incorrect. The answer is \(correctAnswer)")
                        incorrectIndices.append(userAnswer)
                        incorrectCount += 1
                    }
                } else {
                    print("Invalid input.")
                }
            }

            // Check if the user got the correct answer.
            // If not, take not and ask later. 
        }

        // Show the question.

        // Present the possible answers.

        // Check if the user guessed correctly.
        // If not, make a note of the question to ask again later.
    }
}
