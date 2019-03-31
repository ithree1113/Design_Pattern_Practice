// Description: 定義了一個高層介面，此介面使得這一子系統更加容易使用。
// pros: 減少了client端需要處理的類別數目，並使得子系統的變化不影響client端，只需調整Facade類別。
// cons: 如果對client使用子系統做太多限制，則減少了靈活性。且違反開放封閉原則，增加子系統時，有可能需要修改Facade或client的code。


import UIKit

class SubSystemA {
    func subMethodA() {
        print("This is sub-method A.")
    }
}

class SubSystemB {
    func subMethodB() {
        print("This is sub-method B.")
    }
}

class SubSystemC {
    func subMethodC() {
        print("This is sub-method C.")
    }
}

class SubSystemD {
    func subMethodD() {
        print("This is sub-method D.")
    }
}


class Facade {
    let subSystemA = SubSystemA()
    let subSystemB = SubSystemB()
    let subSystemC = SubSystemC()
    let subSystemD = SubSystemD()
    
    func methodA() {
        subSystemA.subMethodA()
        subSystemB.subMethodB()
        subSystemD.subMethodD()
    }
    
    func methodB() {
        subSystemB.subMethodB()
        subSystemC.subMethodC()
    }
}

/////

let facade = Facade()
facade.methodA()
facade.methodB()
