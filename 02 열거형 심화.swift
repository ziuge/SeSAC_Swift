//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


var email: String = "jack@jack.com" // 선언과 초기화 동시에

var email2: String? // 선언만 해두고 나중에 초기화
email2 = "jack@jack.com"


// 타입 확인
type(of: email)
type(of: email2)


var array = Array(repeating: 0, count:100) // 0을 100개 가지고 있는 Array
print(array)

//var array2 = [Int](1...100) // 1~100 Array
var array2: [Int]? = [Int](1...100)
//array2 = nil

// 옵셔널이기 때문에 옵셔널 처리를 해주지 않으면 오류가 뜸
if array2?.count == 0{
    print("값이 없습니다.")
} else {
    print(array2?.count)
}


// MARK: - 삼항 연산자 -> 조건 ? ㅇㅇ : ㄴㄴ
// 조건: bool 값으로 판단할 수 있는 요소, 반환값이 bool 타입인 함수는 가능!
let result = array2 == nil ? "값이 없음" : "값이 있음"

// return 값으로도 활용할 수 있다
// return 값 : 100% 상황에 대한 대응이 가능해야 함
func example() -> String {
    let result = Int.random(in: 1...100)
    
    return result > 50 ? "UP" : "DOWN"
}

example()

func bmiResult() -> (String, Double) {
    let result = Double.random(in: 1...30)
    
    if result < 18.5 {
        return  ("rr", 1.0)
    } else if result >= 18.5 && result < 23 {
        return ("rr", 2.0)
    } else {
        return ("rr", 4.0)
    }
    
//    return 3.0 // 실행될 일이 없음
}

let userBMI = bmiResult()
type(of: userBMI) // tuple

// 문자열 보간법: String Interpolation
print("\(userBMI.0)님의 BMI는 \(userBMI.1)입니다.")
print("\(userBMI.0)" + "님의 BMI는" + "\(userBMI.1)" + "입니다.")


// MARK: - return 생략 - Swift 5.1부터
// 한 줄짜리 코드, return 값이 있는 함수라면 return 키워드 생략 가능
@discardableResult // 반환값을 사용하지 않을 때, 오류나지 않게 하는 키워드. 함수 내부 코드는 다 실행됨.
func randomNumber() -> Int {
    Int.random(in: 1...100)
}

let plusNumber = randomNumber() + 10
print(plusNumber)

randomNumber()

// MARK: - 매개변수 기본값 지정
func sayHello(nickname: String = "손", gender: Int? = 2) -> String {
    return nickname + "님, 반갑습니다!"
}

let user = array2 == nil ? "손님" : "고래밥"
//sayHello(nickname: user)

sayHello()
sayHello(nickname: "테스트")

print("안녕하", separator: "11", terminator: "234")

// MARK: - 열거형
// 성별 남/여/안함 -> 블랙/파란/흰
enum Gender: String {
    case man = "남성"
    case woman = "여성"
    case nothing = "선택안함"
}

var gender: Gender = Gender.man

switch gender {
case .man: print("남성입니다")
case .woman: print("여성입니다")
case .nothing: print("선택하지 않았습니다")
//case "jmt", "JMT": print("존맛탱. 정말 맛있다.") // 여러 개도 가능
default: print("오류입니다")
}

gender.rawValue // 안에 들어간 값으로 표현됨

// MARK: 네트워크 에러 예제
// 차례대로 0, 1, 2, ... 순서대로 rawValue가 들어감. 단, 새로운 숫자를 주었을 경우 다음 요소는 +1
enum HTTPCode: Int {
    case OK // 0
    case NO_PAGE // 1
    case NOT_FOUND = 404
    case SERVER_ERROR // 405
    
    // 함수를 넣을 수도 있음
    func showStatus() -> String {
        switch self {
        case .OK: return "정상"
        case .SERVER_ERROR: return "긴급점검"
        case .NOT_FOUND: return "잘못된 문제"
        case .NO_PAGE: return "페이지를 찾을 수 없음"
        }
    }
    
}

var networkStatus: HTTPCode = .SERVER_ERROR

switch networkStatus {
case .OK: print("정상", networkStatus.rawValue)
case .NO_PAGE: print("잘못된 URL 주소", networkStatus.rawValue)
default: print("기타", networkStatus.rawValue)
}

let showNetworkResult = networkStatus.showStatus() // 열거형 안의 함수에 접근 가능
print(showNetworkResult)




//: [Next](@next)
