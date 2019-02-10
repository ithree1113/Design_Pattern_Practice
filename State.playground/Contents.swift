// Description: 將和某個狀態有關的行為封裝起來，只需改變狀態便可改變行為。
// pros: 可方便增加新的狀態，以增加物件行為。且狀態切換邏輯可置於狀態類別之中，減少巨大switch-case出現的機會。
// cons: 違反開放封閉原則，增加狀態時，需要修改負責狀態轉換的程式。
import UIKit

protocol State {
    func handle(context: Context)
}

class ConcreteStateA: State {
    func handle(context: Context) {
        print("Do something in State A")
        print("Done. Change state to B")
        context.state = ConcreteStateB()
    }
}

class ConcreteStateB: State {
    func handle(context: Context) {
        print("Do something in State B")
        print("Done. Change state to A")
        context.state = ConcreteStateA()
    }
}

class Context {
    var state: State
    
    init(state: State) {
        self.state = state
    }
    
    func request() {
        state.handle(context: self)
    }
}

/////

let context = Context(state: ConcreteStateA())

context.request()
context.request()
context.request()

//------------------------------//

protocol WorkState {
    func handle(work: Work)
}

// ConcreteState
class MorningState: WorkState {
    func handle(work: Work) {
        print("上午工作，精神百倍")
        work.state = NoonState()
    }
}

class NoonState: WorkState {
    func handle(work: Work) {
        print("休息時間，吃午餐")
        work.state = AfternoonState()
    }
}

class AfternoonState: WorkState {
    func handle(work: Work) {
        print("下午工作，持續努力")
        work.state = EveningState()
    }
}

class EveningState: WorkState {
    func handle(work: Work) {
        guard !work.finish else {
            work.state = RestState()
            work.startToWork()
            return
        }
        print("加班中")
        work.state = RestState()
    }
}

class RestState: WorkState {
    func handle(work: Work) {
        print("下班回家")
    }
}

// Context
class Work {
    var state: WorkState = MorningState()
    var finish: Bool = false
    
    func startToWork() {
        state.handle(work: self)
    }
}

/////

let work = Work()
work.startToWork()

work.startToWork()

work.startToWork()

//work.finish = true
work.startToWork()

work.startToWork()
