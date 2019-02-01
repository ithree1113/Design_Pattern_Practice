// Description: Proxy可以成為client端和目標對象的中間人，並且可以通過Proxy去除掉client端不需看到的內容或者添加額外的需要。
// pros: 一定程度降低了client端和被調用對象的耦合度，並可控制client端對實際對象的控制權限。
// cons: 由於增加了Proxy，某些時候可能會造成運行的速度變慢。

import UIKit

protocol Subject {
    func request()
}

class RealSubject: Subject {
    
    func request() {
        print("\(type(of: self)): request")
    }
}


class Proxy: Subject {

    let realSubject: RealSubject = RealSubject()
    
    func request() {
        preRequest()
        realSubject.request()
        postRequest()
    }
    
    private func preRequest() {
        print("\(type(of: self)): preRequest")
    }
    
    private func postRequest() {
        print("\(type(of: self)): postRequest")
    }
    
}

/////

let proxy = Proxy()
proxy.request()
