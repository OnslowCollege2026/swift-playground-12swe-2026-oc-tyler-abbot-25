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

        /// The indices of the questions that the user got wrong initially.
        var wrongQuestions: Set<Int> = []

        /// The number of questions that the user got wrong first time around.
        var incorrectCount = 0

        /// The number of questions the user got right.
        var correctCount = 0 
        
        // Asks all of the questions the first time.
        for questionIndex in 0..<vocabulary.count { 
            let correctAnswer = vocabulary[questionIndex][1]
            let options = Array(vocabulary[questionIndex][1...4]).shuffled()

            // Asks the user the question
            print("What is the word \(vocabulary[questionIndex][0]) in spanish?")

            // Prints out the different options for the user to select.
            for (index, option) in options.enumerated() {
                print("\(index + 1). \(option)")
            }
            print("Enter your answer: ")

            // Checks the users input to see if it is valid.
            if let userInput = readLine() {
                if let userAnswer = Int(userInput), userAnswer > 0, userAnswer <= 4 {

                    // Checks if the answer is correct or incorrect. 
                    if options[userAnswer - 1] == correctAnswer {
                        print("That is correct. ")
                        correctCount += 1
                    } else {
                        // Adds the index for the question into an array if it is wrong.
                        print("That is incorrect. The answer is \(correctAnswer)")
                        wrongQuestions.insert(questionIndex)
                        incorrectCount += 1
                    }
                } else {
                    print("Invalid input.")

                    // Adds the index for the question into the array if the input is invalid.
                    wrongQuestions.insert(questionIndex)
                    incorrectCount += 1
                }
            } else {
                // Adds the index for the question into the array if there is no input.
                wrongQuestions.insert(questionIndex)
                incorrectCount += 1
            }
        }
        
        // Repeats until the wrongQuestions array is empty.
        while !wrongQuestions.isEmpty {
            /// Empties the wrongQuestions array so that it can be refilled if the answers are still wrong. 
            let currentWrongs = wrongQuestions
            wrongQuestions.removeAll()
            
            // Repeats questions that are wrong. 
            for questionIndex in currentWrongs.sorted() {  

                /// 
                let correctAnswer = vocabulary[questionIndex][1]
                let options = Array(vocabulary[questionIndex][1...4]).shuffled()

                print("What is the word \(vocabulary[questionIndex][0]) in spanish?")

                // Prints out the different options for the user to select.
                for (index, option) in options.enumerated() {
                    print("\(index + 1). \(option)")
                }
                print("Enter your answer: ")

                // Checks the users input to see if it is valid.
                if let userInput = readLine() {
                    if let userAnswer = Int(userInput), userAnswer > 0, userAnswer <= 4 {

                        // Checks if the answer is correct or incorrect. 
                        if options[userAnswer - 1] == correctAnswer {
                            print("That is correct. ")
                        } else {
                            print("That is incorrect. The answer is \(correctAnswer)")
                            wrongQuestions.insert(questionIndex) 
                        }
                    } else {
                        print("Invalid input.")
                        wrongQuestions.insert(questionIndex)
                    }
                } else {
                    wrongQuestions.insert(questionIndex)
                }
            }
        }
        
        // Informs the user how many questions they got right or wrong. 
        print("You got \(correctCount) questions right on the first try.")
        print("You got \(incorrectCount) questions wrong initially.")
    }
}
