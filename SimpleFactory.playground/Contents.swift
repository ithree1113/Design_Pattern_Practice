// Description: 將物件的生成以及物件本身業務邏輯分離，降低系統耦合度。
// pros: client端免除了生成產品的責任，僅僅使用，簡化client端。
// cons: 每增加一個產品便得增加一個類別，可能造成系統複雜度。且必得修改工廠類別，一旦產品數量較多時，工廠類別責任可能過重。

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

/////

let operationAdd = OperationFactory.createOpration(.add)
print(operationAdd.getResult(inputA: 2.3, inputB: 3))

let operationSub = OperationFactory.createOpration(.sub)
print(operationSub.getResult(inputA: 7.4, inputB: 3.2))

let operationMul = OperationFactory.createOpration(.mul)
print(operationMul.getResult(inputA: 6, inputB: 4))

let operationDiv = OperationFactory.createOpration(.div)
print(operationDiv.getResult(inputA: 6, inputB: 2))
