import UIKit

protocol Operation {
    func getResult(inputA: Double, inputB: Double) -> Double
}

class OperationAdd: Operation {
    func getResult(inputA: Double, inputB: Double) -> Double {
        return inputA + inputB
    }
}

class OperationSub: Operation {
    func getResult(inputA: Double, inputB: Double) -> Double {
        return inputA - inputB
    }
}

class OperationMul: Operation {
    func getResult(inputA: Double, inputB: Double) -> Double {
        return inputA * inputB
    }
}

class OperationDiv: Operation {
    func getResult(inputA: Double, inputB: Double) -> Double {
        guard inputB != 0 else { fatalError("除數不可為0") }
        
        return (inputA / inputB)
    }
}

class OperationFactory {
    enum Operate {
        case add
        case sub
        case mul
        case div
    }
    
    static func createOpration(_ operate: Operate) -> Operation {
        switch operate {
        case .add:
            return OperationAdd()
        case .sub:
            return OperationSub()
        case .mul:
            return OperationMul()
        case .div:
            return OperationDiv()
        }
    }
}

let operationAdd = OperationFactory.createOpration(.add)
print(operationAdd.getResult(inputA: 2.3, inputB: 3))

let operationSub = OperationFactory.createOpration(.sub)
print(operationSub.getResult(inputA: 7.4, inputB: 3.2))

let operationMul = OperationFactory.createOpration(.mul)
print(operationMul.getResult(inputA: 6, inputB: 4))

let operationDiv = OperationFactory.createOpration(.div)
print(operationDiv.getResult(inputA: 6, inputB: 2))
