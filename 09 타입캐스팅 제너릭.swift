//: [Previous](@previous)

import Foundation
import UIKit

/*
 TypeCasting
 - 형변환 => 타입캐스팅/타입변환
 - 타입캐스팅: 인스턴스의 타입을 확인하거나 인스턴스 자신의 타입을 다른 타입의 인스턴스인 것처럼 사용할 때 활용되는 개념
 */

let a = 3
let value = String(a) // 이니셜라이저 구문을 통해 새롭게 인스턴스를 생성한 것 = 형변환

type(of: a)         // Int.Type
type(of: value)     // String.Type


class Mobile {
    let name: String
    var introduce: String {
        return "\(name)입니다"
    }
    
    init(name: String) {
        self.name = name
    }
}

class Google: Mobile {
    
}

class Apple: Mobile {
    let wwdc = "WWDC22"
}

// 세 가지 인스턴스 생성
let mobile = Mobile(name: "PHONE")
let apple = Apple(name: "APPLE")
let google = Google(name: "GOOGLE")

// MARK: 1. is : 어떤 클래스의 인스턴스 타입인지 확인하기 위해 사용
// a is b : a가 b 타입인지 확인
// ex. Local notification
mobile is Mobile   // true
mobile is Apple    // false
mobile is Google   // false

apple is Mobile    // true
apple is Apple     // true
apple is Google    // false

// MARK: 2. Type Cast Operator : as (업캐스팅) / as?, as! (다운캐스팅)

let iphone: Mobile = Apple(name: "APPLE") // wwdc 프로퍼티 접근 불가능
iphone.introduce

// as? 옵셔널 반환 타입 => 실패할 경우 nil 반환
// as! 옵셔널 X -> 실패할 경우 무조건 런타임 오류 발생
if let value = iphone as? Apple {
    print(value.wwdc)
}

if let value = iphone as? Google {
    print(value)
} else {
    print("타입 캐스팅 실패")
}
// iphone as! Google -> 런타임 오류

apple as Mobile // 업캐스팅


// MARK: Any (모든 타입에 대한 인스턴스 담을 수 있음) vs AnyObject (클래스의 인스턴스만 담을 수 있음)
// 컴파일 시점에서는 어떤 타입인지 알 수 없고, 런타임 시점에 타입이 결정됨
var somethings: [Any] = []

somethings.append(0)
somethings.append(true)
somethings.append("something")
somethings.append(mobile)

print(somethings[1])

let example = somethings[1]

if let element = example as? Bool {
    print(element)
} else {
    print("Bool 아님")
}

if let element = example as? String {
    print(element.count)
} else {
    print("Bool 아님")
}


let name: String? = "abc"


/*
 MARK: Generic
 - 타입에 유연하게 대응하기 위한 요소
 - Type Parameter: 플레이스 홀더 같은 역할. 어떤 타입인지 타입의 종류는 알려주지 않음. 특정한 타입 하나라는 건 알 수 있음. 제네릭으로 이루어진 함수 사용 시 T에 들어갈 타입은 모두 같아야 한다. UpperCased. ex. T U K 같이 대문자 한 글자
 - Type Constraints: 클래스/프로토콜 제약
 */

func configureBorderLabel(_ view: UILabel) {
    view.backgroundColor = .clear
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 1
}

func configureBorderButton(_ view: UIButton) {
    view.backgroundColor = .clear
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 1
}

func configureBorderTextField(_ view: UITextField) {
    view.backgroundColor = .clear
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 1
}

func configureBorder<JACK: UIView>(_ view: JACK) {
    view.backgroundColor = .clear
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 1
}

let img = UIImageView()
let lbl = UILabel()
configureBorder(img)
configureBorder(lbl)



struct DummyData<T, U> { // 나누어져 있으면 T, U는 서로 타입이 달라도 됨!
    var mainContents: T
    var subContents: U
}

//let data = DummyData(name: "abc")
//let intData = DummyData(name: 444)

let cast = DummyData(mainContents: "현빈", subContents: "주인공역")
let phoneNumber = DummyData(mainContents: "고래밥", subContents: "01011112222")
let todo = DummyData(mainContents: "할일 목록", subContents: true) // 문제 없이 처리 가능!




func tota(a: [Int]) -> Int {
    return a.reduce(0, +)
}

total(a: [1,2, 3, 4,5, 6, 7, 8, 9])
total(a: [4.5, 7.7, 3.2, 1.2232])

func total<T: Numeric>(a: [T]) -> T {
    return a.reduce(.zero, +)
}



// 화면 전환 코드
class SampleViewController: UIViewController {
    func transitionViewController<T: UIViewController>(sb:String, vc: T) {
        let sb = UIStoryboard(name: sb, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: String(describing: vc)) as! T
        
        self.present(vc, animated: true)
    }
    
}


class Animal: Equatable {
    
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.name == rhs.name
    }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let one = Animal(name: "고양이")
let two = Animal(name: "고양이")

one.name == two.name

one == two



var fruit1 = "사과"
var fruit2 = "바나나"

swap(&fruit1, &fruit2)
print(fruit1, fruit2)


func swapTwoInts(a: inout Int, b: inout Int) { // 매개변수는 let, 그런데 바꾸고 싶으면 inout 키워드 불러주면 됨
    let tempA = a
    a = b
    b = tempA
}

//swapTwoInts(a: &fruit1, b: &fruit2)
print(fruit1, fruit2)



//: [Next](@next)
