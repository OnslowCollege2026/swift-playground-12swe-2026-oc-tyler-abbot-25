// The Swift Programming Language
// https://docs.swift.org/swift-book

// Second variation of the Duolingo that I made. 

@main
struct SwiftPlayground {
    static func main() {

        let vocabulary = [
            ["Hello",              "Hola", "Y tu", "Bueno", "Decir"],
            ["Goodbye",  "Adios", "Hola", "Buenos dias", "Necessito"],
            ["Please",     "Por Favor", "Hola", "Adios", "Lo siento"],
            ["Thanks", "Gracias", "Lo siento", "Mi opinion", "Hacer"],
            ["My name is",   "Me llamo", "Hola","Por favor", "Bueno"]
        ]

        var counter = 0
        var score = 0
        var incorrectAnswerIndices: [Int] = []

        while counter < vocabulary.count {
            let englishWord = vocabulary[counter][0]
            let correctWord = vocabulary[counter][1]
            let allAnswers = vocabulary[counter].dropFirst().shuffled()

            print("What is \(englishWord) in Spanish?")
            allAnswers.forEach { answer in
                print("- \(answer)")
            }

            if let userInput:String = readLine(), userInput.lowercased() == correctWord.lowercased() {
                score += 1
                print("Good job, you got it right!")
            } else {
                incorrectAnswerIndices.append(counter)
                print("Incorrect! The right answer is \(correctWord)")
                counter += 1
            }

        }

        while incorrectAnswerIndices.count > 0 {
            let index = incorrectAnswerIndices[0]

            let englishWord = vocabulary[index][0]
            let correctWord = vocabulary[index][1]
            let allAnswers = vocabulary[index].dropFirst().shuffled()

            print("What is \(englishWord) in Spanish?")
            allAnswers.forEach { answer in
                print("- \(answer)")
            }

            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                incorrectAnswerIndices.removeFirst()
                print("Good job, you got it right!")
            } else {
                print("Incorrect! The right answer is \(correctWord)")
            }
        }

        print("""
        -------  SCORE CARD -------
        Initially, you got \(score) questions right the first time!
        Initially, you got \(counter) questions wrong the first time. 
        """)
    }
}
