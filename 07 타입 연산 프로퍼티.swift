//: [Previous](@previous)

import UIKit

// 인스턴스 생성 여부와 상관없이 타입 프로퍼티의 값은 하나다!

struct User {
    static var originalName = "진짜이름" // 타입 저장 프로퍼티 - 값 하나만 쓸 수 있다.
    var nickname = "고래밥" // 인스턴스 저장 프로퍼티 - 다 다른 값을 쓸 수 있다.
}

var user1 = User()
user1.nickname = "칙촉"
User.originalName = "리Jack"
print(user1.nickname, User.originalName)

var user2 = User()
print(user2.nickname, User.originalName)

var user3 = User()
print(user3.nickname, User.originalName)

var user4 = User()
print(user4.nickname, User.originalName)

// 각각의 인스턴스마다 사용하는 공간이 다르기 때문에 다 다른 닉네임을 가질 수 있음
// 그러나 타입 프로퍼티는 하나. 인스턴스 생성과 관계없이 타입 프로퍼티가 가질 수 있는 값은 하나


// MARK: 연산 프로퍼티
/*
 연산 프로퍼티(인스턴스 연산 프로퍼티 / 타입 연산 프로퍼티)
 */

struct BMI {
    var nickname: String  { // 구조체 안에서 초기화하지 않아도 잘 실행되는 이유는? bmi 인스턴스를 생성할 때 초기화를 무조건 해주기 때문
        willSet {
            print("유저 닉네임이 \(nickname)에서 \(newValue)로 변경될 예정입니다.")
        }
        didSet {
            print("닉네임 변경됨 \(oldValue) -> \(nickname)")
        }
    }
    var weight: Double
    var height: Double
    
    // 저장 프로퍼티는 메모리 O, 연산 프로퍼티는 저장 프로퍼티를 활용해서 원하는 값을 반환하는 용도로 주로 사용!
    // 읽기 전용 프로퍼티이지만 계산하는 값에 따라 결과가 다 달라질 수 있기 때문임
    var BMIResult: String {
        get {
            let bmiValue = (weight * weight) / height
            let bmiStatus = bmiValue < 18.5 ? "저체중" : "정상 이상"
            return "\(nickname)님의 BMI지수는 \(bmiValue)로 \(bmiStatus)입니다."
        }
        set {
            nickname = newValue
        }
    }
    
    var sample: String {
        return "100"
    }
}

var bmi = BMI(nickname: "고래밥", weight: 50, height: 180)

let result1 = bmi.BMIResult // get
print(result1)

bmi.BMIResult = "스노기" // set
print(bmi.BMIResult)


let bmiValue = (bmi.weight * bmi.weight) / bmi.height
let bmiStatus = bmiValue < 18.5 ? "저체중" : "정상 이상"
let result = "\(bmi.nickname)님의 BMI지수는 \(bmiValue)로 \(bmiStatus)입니다."
print(result)
print(bmi.BMIResult)



class FoodRestaurant {
    let name = "JackChicken"
    var totalOrderCount = 0 // 총 주문 건수
    
    var nowOrder: Int {
        get {
            return totalOrderCount * 5000
        }
        set {
            totalOrderCount += newValue // 기본 파라미터 newValue
        }
    }
}

let food = FoodRestaurant()

print(food.nowOrder)

//food.totalOrderCount += 20
food.nowOrder = 5
print(food.nowOrder)
food.nowOrder = 20
print(food.nowOrder)

// label text vs button currentTitle의 차이

// 열거형은 타입 자체 > 인스턴스 생성이 불가능하다 > 초기화 구문이 X
// 인스턴스 생성을 통해서 접근할 수 있는 인스턴스 저장 프로퍼티 사용 불가! 인스턴스 연산 프로퍼티는?
// 메모리의 관점 + 열거형이 컴파일 타임에 확정되어야 한다! > 인스턴스 연산 프로퍼티는 열거형에서 사용할 수 있다...
// 타입 저장 프로퍼티 => 열거형에서 사용 가능
enum ViewType {
    case start
    case change
    
//    var nickname: String = "고래밥"
    
    var nickname: String {
        return "고래밥"
    }
    
    static var title = "시작하기"
}

// 타입 프로퍼티는 인스턴스랑 상관없이 접근 가능! > 따라서 열거형에서 타입 저장 프로퍼티, 타입 연산 프로퍼티는 모두 사용 가능!
// 인스턴스 저장 프로퍼티는 메모리에, 값이 달라질 수 있음 > X > 열거형은 초기화 구문을 만들 수 없기 때문입니다.

// 타입 저장 프로퍼티, 타입 연산 프로퍼티, 인스턴스 저장 프로퍼티, 인스턴스 연산 프로퍼티


class TypeFoodRestaurant {
    static let name = "JackChicken"
    static var totalOrderCount = 10 {// 총 주문 건수
        willSet { // 변경 되기 직전에 실행
            print("총 주문 건수가 \(totalOrderCount)에서 \(newValue)로 변경될 예정입니다.")
        }
        didSet { // 변경 되고난 직후에 실행
            print("총 주문 건수가 \(oldValue)에서 \(totalOrderCount)로 변경되었습니다.")
        }
    }
        
    static var nowOrder: Int {
        get {
            return totalOrderCount * 5000
        }
        set {
            totalOrderCount += newValue // 기본 파라미터 newValue
        }
    }
}

TypeFoodRestaurant.nowOrder // get 호출, 연산됨. 타입 연산 프로퍼티 Get

TypeFoodRestaurant.nowOrder = 15 // 타입 연산 프로퍼티 Set

TypeFoodRestaurant.nowOrder


// Property Observer
// 저장 프로퍼티에서 주로 사용되고, 저장 프로퍼티 값을 관찰하다가 변경이 될 것 같을 때 또는 변경이 되었을 때 호출됨 (willSet / didSet)


// 메서드 : 타입 메서드 & 인스턴스 메서드

struct Coffee {
    static var name = "아메리카노"
    static var shot = 2
    var price = 4900 // Coffee.price 로 접근할 수 없음
    
//    func plusShot() {
//        // shot += 1 // 명확하게 타입 프로퍼티를 호출해주어야 함
//        Coffee.shot += 1
//        price += 300
//    }
    
//    static func plusShot() { // 타입이라 인스턴스에 접근 못함.
    mutating func plusShot() { // 구조체 내에서 자기자신의 프로퍼티 변경할 때는 mutating 키워드
        Coffee.shot += 1
        price += 300
    }
    
//    class func minusShot() { // 오버라이드 하고 싶다면 class 키워드를 써야 함. Coffee가 struct로 바뀐다면 오류남(오버라이드 불가능)
//        shot -= 1
//    }
    
    static func minusShot() {
        shot -= 1
    }
}

//class Latte: Coffee {
//    override class func minusShot() { // 슈퍼클래스의 타입 메서드를 재정의해서 쓰고 싶다면 static 대신에 class 키워드를 써야 함
//        <#code#>
//    }
//}





//: [Next](@next)
