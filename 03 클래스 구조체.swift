//: [Previous](@previous)

import Foundation

// SuperClass, SubClass, BaseClass
class Monster {
    var clothes = "Orange"
    var speed = 5
    var power = 20
    var expoint: Double = 500
    
    func attack() {
        print("공격!")
    }
}

var easyMonster = Monster() // 초기화
easyMonster.clothes
easyMonster.power
easyMonster.attack()
easyMonster.attack()

// 기본 Monster 베이스로 BossMonster를 만들기 -> 상속
class BossMonster: Monster {
    var levelLimit = 500
    
    func bossAttack() {
        print("스페셜 공격")
    }
    
    override func attack() { // 부모클래스로부터 가져와서 재정의하기 override
        super.attack()
        print("오버라이드 공격!")
    }
}

var finalBoss = BossMonster()
finalBoss.bossAttack()
finalBoss.levelLimit
finalBoss.speed
finalBoss.attack()


// MARK: 구조체와 클래스의 차이
// 구조체는 값 타입, 클래스는 참조 타입

// String은 구조체
// 서로 영향을 미치지 않음
var nickname = "고래밥"
var subNickname = nickname
subNickname = "칙촉"
print(nickname) // 고래밥
print(subNickname) // 칙촉

// Monster은 클래스
var miniMonster = Monster()
var bossMonster = miniMonster
bossMonster.power = 5000
print(miniMonster.power) // 5000
print(bossMonster.power) // 5000



//: [Next](@next)
