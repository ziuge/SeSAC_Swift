//: [Previous](@previous)

import Foundation

protocol MyDelegate: AnyObject {
    func sendData(_ data: String)
}

class Main: MyDelegate {
    
    lazy var detail: Detail = {
        let view = Detail()
        view.delegate = self
        return view
    }()
    
    func sendData(_ data: String) {
        print("\(data)를 전달받았땅")
    }
    
    init() {
        print("Main init")
    }
    deinit {
        print("Main Deinit")
    }
}

class Detail {
    
    weak var delegate: MyDelegate? // 타입으로서 프로토콜. 클래스의 인스턴스가 들어올 수 있음. // delegate 에서는 무조건 써야 인스턴스가 해제됨
    
    func dismiss() {
        delegate?.sendData("안녕")
    }
    
    init() {
        print("Detail init")
    }
    deinit {
        print("Detail Deinit")
    }
}

var main: Main? = Main() //RC 1
main?.detail //RC 1
main = nil //RC 1

var example: MyDelegate = Main()



//: [Next](@next)
