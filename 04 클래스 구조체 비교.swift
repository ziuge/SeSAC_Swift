//: [Previous](@previous)

import Foundation

// 옵셔널로 선언된 프로퍼티는 nil을 가질 수 있기 때문에 나중에 초기화해주어도 됨
// 프로퍼티가 nil을 담을 수 없다면 값이 무조건 있어야 함 -> 초기화가 필요함
class Monster {
    var name: String? // -> Optional
    var level: Int?
    
//    init(jack: String, jackjack: Int){
//        name = jack // class 블록 안에 가장 가까운 name을 찾아감
//        level = jackjack
//    }
    
    init(name: String, level: Int) { // 초기화 구문. 이니셜라이저
        self.name = name // 가장 가까운 name은 매개변수, self.name은 class 블록 안에서 찾음
        self.level = level
    }
}

let easy = Monster(name: "쉬운몬스터", level: 1)

easy.name = "쉬운몬스터" // 아까 선언된 let은 참조하는 원본에 대한 let이므로 여기서는 값을 바꿀 수 있음
//easy.level = 2 // 여기서는 클래스에 지정된 level 값이 let이기 때문에 오류가 선언됨

var hard = easy

hard.name = "보스몬스터"
hard.level = 100

print(easy.name, easy.level)
print(hard.name, hard.level)


struct StructMonster {
    var name: String
    var level = 1
    
    // init 쓰지 않아도 동작함!
    // struct는 멤버와이즈 초기화 구문이 제공됨
}

var structMonster = StructMonster(name: "Struct", level: 2)

structMonster.name = "쉬운몬스터"
structMonster.level =  2

//: [Next](@next)
