// Description: 是對演算法的封裝，便可交由不同的對象管理，使得他們可以互換。
// pros: 可在不修改原有系統的基礎上更改演算法，也可靈活增加新的演算法。
// cons: client端必須自行判斷該使用哪一個演算法。


import UIKit

// Strategy
protocol CashStrategy {
    func getFinalAmount(totalPrice: Double) -> Double
}

// ConcreteStrategy
class CashNormal: CashStrategy {
    func getFinalAmount(totalPrice: Double) -> Double {
        return totalPrice
    }
}

// ConcreteStrategy
class CashDiscount: CashStrategy {
    let rate: Double
    
    init(rate: Double) {
        self.rate = rate
    }
    
    func getFinalAmount(totalPrice: Double) -> Double {
        return totalPrice * rate
    }
}

// ConcreteStrategy
class CashBonus: CashStrategy {
    let condition: Double
    let returnBonus: Double

    init(condition: Double, returnBonus: Double) {
        self.condition = condition
        self.returnBonus = returnBonus
    }
    
    func getFinalAmount(totalPrice: Double) -> Double {
        guard totalPrice >= condition else { return totalPrice }
        
        return totalPrice - (floor(totalPrice/condition) * returnBonus)
    }
}

// Context
class CashContext {
    var cashStrategy: CashStrategy
    
    init(cashStrategy: CashStrategy) {
        self.cashStrategy = cashStrategy
    }
    
    func getTotalPrice(_ totalPrice: Double) -> Double {
        return cashStrategy.getFinalAmount(totalPrice: totalPrice)
    }
}

/////

let totalPrice = 1000.0

let normal = CashNormal()
let cashContext = CashContext(cashStrategy: normal)
print("最後的金額為\(cashContext.getTotalPrice(totalPrice))")

let discount = CashDiscount(rate: 0.8)
cashContext.cashStrategy = discount
print("最後的金額為\(cashContext.getTotalPrice(totalPrice))")

let bouns = CashBonus(condition: 300, returnBonus: 100)
cashContext.cashStrategy = bouns
print("最後的金額為\(cashContext.getTotalPrice(totalPrice))")
