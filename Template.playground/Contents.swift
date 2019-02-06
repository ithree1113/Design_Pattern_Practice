// Description: 定義出一行為的骨架，而將某些步驟延遲至子類別中，使得子類別不需改變此行為的結構，便可重新定義某些特定步驟。
// pros: 將不變的行為搬移至父類別或protocol，以去除重複的程式碼。
// cons:
import UIKit

protocol AbstractProtocol {
    func primitiveOperationA()
    func primitiveOperationB()
    
    func templateMethod()
}

extension AbstractProtocol {
    func templateMethod() {
        primitiveOperationA()
        primitiveOperationB()
    }
}

class ConcreteClassA: AbstractProtocol {
    func primitiveOperationA() {
        print("Concrete Class A: Operation A")
    }
    
    func primitiveOperationB() {
        print("Concrete Class A: Operation B")
    }
}

class ConcreteClassB: AbstractProtocol {
    func primitiveOperationA() {
        print("Concrete Class B: Operation A")
    }
    
    func primitiveOperationB() {
        print("Concrete Class B: Operation B")
    }
}

/////

let concreteA = ConcreteClassA()
concreteA.templateMethod()
let concreteB = ConcreteClassB()
concreteB.templateMethod()

//------------------------------------------------------------------//

protocol TestPaper {
    func testQuestion1()
    func testQuestion2()
    func testQuestion3()
    
    func answer1() -> String
    func answer2() -> String
    func answer3() -> String
}

extension TestPaper {
    func testQuestion1() {
        print("Question 1:")
        print("Answer is \(answer1())")
    }
    
    func testQuestion2() {
        print("Question 2:")
        print("Answer is \(answer2())")
    }
    
    func testQuestion3() {
        print("Question 3:")
        print("Answer is \(answer3())")
    }
}

class TestPaperByStudentA: TestPaper {
    func answer1() -> String {
        return "a"
    }

    func answer2() -> String {
        return "c"
    }

    func answer3() -> String {
        return "b"
    }
}

class TestPaperByStudentB: TestPaper {
    func answer1() -> String {
        return "c"
    }
    
    func answer2() -> String {
        return "a"
    }
    
    func answer3() -> String {
        return "a"
    }
}

//////

let studentA = TestPaperByStudentA()
studentA.testQuestion1()
studentA.testQuestion2()
studentA.testQuestion3()
let studentB = TestPaperByStudentB()
studentB.testQuestion1()
studentB.testQuestion2()
studentB.testQuestion3()
