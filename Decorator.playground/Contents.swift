// Description: 將新功能封裝，再利用關連關係，擴展原本功能。
// pros: 透過多個不同裝飾類別的組合，可創造出許多不同行為。且增加新功能時，不需更動原有功能。
// cons: 經過多次裝飾的物件，使用時若有bug，不易於追蹤。

import UIKit

// Component
// ConcreteComponent
class BasicService {
    func operation() {
        print("Run Basic Service\n")
    }
}

// Decorator
class Decorator: BasicService {
    let base: BasicService
    
    init(baseOn: BasicService) {
        base = baseOn
        super.init()
    }
}

// ConcreteDecorator
class NewFunctionA: Decorator {
    override func operation() {
        print("Run New Function A")
        base.operation()
    }
}

// ConcreteDecorator
class NewFunctionB: Decorator {
    override func operation() {
        print("Run New Function B")
        base.operation()
    }
}

// ConcreteDecorator
class NewFunctionC: Decorator {
    override func operation() {
        print("Run New Function C")
        base.operation()
    }
}

// ConcreteDecorator
class NewFunctionD: Decorator {
    override func operation() {
        print("Run New Function D")
        base.operation()
    }
}

/////

let basicService = BasicService()
var newFunctionA = NewFunctionA(baseOn: basicService)
var newFunctionB = NewFunctionB(baseOn: newFunctionA)
let newFunctionD = NewFunctionD(baseOn: newFunctionB)
newFunctionD.operation()

newFunctionB = NewFunctionB(baseOn: basicService)
newFunctionA = NewFunctionA(baseOn: newFunctionB)
let newFunctionC = NewFunctionC(baseOn: newFunctionA)
newFunctionC.operation()
