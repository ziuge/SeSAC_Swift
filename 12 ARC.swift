//: [Previous](@previous)

import Foundation

class Guild {
    var name: String
//    weak var owner: User? // 길드장
    unowned var owner: User? // 길드장
    
    init(name: String) {
        self.name = name
        print("Guild init")
    }
    
    deinit {
        print("Guild deinit")
    }
    
}

class User {
    var name: String
    var guild: Guild? // 고래밥이 새싹 길드에 있다면? (어떤 길드에 들어있는지 내용)
    
    init(name: String) {
        self.name = name
        print("User init")
    }
    
    deinit {
        print("User deinit")
    }
}

// 클래스 인스턴스 생성 -> 메모리에 올라감
var user: User? = User(name: "고래밥") // RC + 1 -> User: RC 1
var guild: Guild? = Guild(name: "SeSAC") // RC + 1 -> Guild: RC 1


// 이부분이 있으면 메모리에서 해제가 안 됨! deinit 안 불러와짐
// 이런 것들이 쌓이고 쌓이면 메모리 낭비가 될 수 있음
user?.guild = guild // 유저(고래밥)가 새싹 길드에 들어감 // 참조하는 곳이 두 군데가 됨 // Guild: RC 2
guild?.owner = user // 새싹 길드의 길드장이 고래밥이 됨 // User: RC 2 // weak 이므로 owner에 대한 RC가 증가하지 않음 User: RC 1


// 순환 참조 중인 요소를 먼저 nil
// 인스턴스의 참조 관계를 먼저 해제 => 그런데 코드가 쌓이면 어려움 => weak, unowned가 등장
//guild?.owner = nil // Guild: RC 2 > 1
//user?.guild = nil // 둘 중 아무거나 상관없이 길드나 유저가 둘 다 deinit됨!


// 메모리에서 해제
guild = nil // RC - 1 -> Guild: RC 0
user = nil // RC - 1 -> User: RC 0

guild?.owner
//user?.guild







//: [Next](@next)
