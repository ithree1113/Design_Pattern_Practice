// Description: 定義一個工廠介面，再由符合此介面的具體工廠類別來生成產品
// pros: 當需要增加新產品時，不需要修改原有工廠類別，而是添加符合工廠抽象介面的新工廠，完全符合開發-封閉原則。
// cons: 增加新產品時，除了具體產品類別，還需要增加對應的具體工廠類別，整體的類別數量將成對增加，某種程度地增加程式複雜度。且client端皆是使用抽象介面進行宣告，也增加了抽象性與理解難度。

import UIKit

// Product
protocol Operation {
    func getResult(inputA: Double, inputB: Double) -> Double
}

// ConcreteProduct
class OperationAdd: Operation {
    func getResult(inputA: Double, inputB: Double) -> Double {
        return inputA + inputB
    }
}

// ConcreteProduct
class OperationSub: Operation {
    func getResult(inputA: Double, inputB: Double) -> Double {
        return inputA - inputB
    }
}

// ConcreteProduct
class OperationMul: Operation {
    func getResult(inputA: Double, inputB: Double) -> Double {
        return inputA * inputB
    }
}

// ConcreteProduct
class OperationDiv: Operation {
    func getResult(inputA: Double, inputB: Double) -> Double {
        guard inputB != 0 else { fatalError("除數不可為0") }
        
        return (inputA / inputB)
    }
}


// Factory
protocol OperationFactory {
    func createOperation() -> Operation
}

class AddFactory: OperationFactory {
    func createOperation() -> Operation {
        return OperationAdd()
    }
}

class SubFactory: OperationFactory {
    func createOperation() -> Operation {
        return OperationSub()
    }
}

class MulFactory: OperationFactory {
    func createOperation() -> Operation {
        return OperationMul()
    }
}

class DivFactory: OperationFactory {
    func createOperation() -> Operation {
        return OperationDiv()
    }
}

/////

var factory: OperationFactory = AddFactory()
var operation = factory.createOperation()
print(operation.getResult(inputA: 2.3, inputB: 3))

factory = SubFactory()
operation = factory.createOperation()
print(operation.getResult(inputA: 7.4, inputB: 3.2))

factory = MulFactory()
operation = factory.createOperation()
print(operation.getResult(inputA: 6, inputB: 4))

factory = SubFactory()
operation = factory.createOperation()
print(operation.getResult(inputA: 6, inputB: 2))
