// Description:
// pros:
// cons:


import UIKit

protocol CashStrategy {
    func getFinalAmount(totalPrice: Double) -> Double
}

class CashNormal: CashStrategy {
    func getFinalAmount(totalPrice: Double) -> Double {
        return totalPrice
    }
}

class CashDiscount: CashStrategy {
    let rate: Double
    
    init(rate: Double) {
        self.rate = rate
    }
    
    func getFinalAmount(totalPrice: Double) -> Double {
        return totalPrice * rate
    }
}

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
