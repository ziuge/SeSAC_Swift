//: [Previous](@previous)
//: ### 안녕

import Foundation

class User {
    var nickname = "JACK"
    
    lazy var introduce: () -> String = { [weak self] in
        return "저는 \(self?.nickname ?? "손님")입니다." // 알아서 순환참조를 해버림 // 옵셔널 대체 구문 설정
    }
    
    init() {
        print("User init")
    }
    deinit {
        print("User deinit")
    }
}

var user: User? = User()

user?.introduce // deinit 되지 않음 // RC + 1

user = nil


func myClosure() {
    var number = 0 // number는 Int -> Int는 클래스 -> 클래스는 값타입
    print("1: \(number)")
    
    let closure: () -> Void = { [number] in // [number] 값을 캡쳐하면? 값 그 자체를 가져옴 // 값 복사. 독립적인 코드로 사용됨
        print("closure: \(number)")
    }
    
    closure()
    
    number = 100
    print("2: \(number)")
    
    closure()
}

myClosure()

//: [Next](@next)
