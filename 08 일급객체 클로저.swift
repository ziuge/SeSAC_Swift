//: [Previous](@previous)

import Foundation
import Darwin

// 함수, 일급 객체, 클로저

/*
 1급 객체
 1. 변수나 상수에 함수를 대입할 수 있다.
 2. 함수의 반환 타입으로 함수를 사용할 수 있다.
 3. 함수의 인자값으로 함수를 사용할 수 있다.
 */

func checkBankInfo(bank: String) -> Bool {
    let bankArray = ["우리", "국민", "신한"]
    return bankArray.contains(bank) ? true : false
}

// 변수나 상수에 함수를 실행해서 반환된 반환값을 대입한 것(1급 객체의 특성은 아님)
let checkResult = checkBankInfo(bank: "우리")
print(checkResult)

// 변수나 상수에 함수 '자체'를 대입할 수 있다(1급 객체의 특성)
let checkAccount = checkBankInfo    // 단지 함수만 대입한 상태로, 실행된 상태는 아님
checkAccount("신한")                 // 함수를 호출해주어야 실행된다

// (String) -> Bool => Function Type (ex. Tuple) 어떤 매개변수를 가지고 있느냐에 따라 function type은 달라짐
let tupleExample: (Int, Int, String, Bool) = (1, 2,"dd", true)


// MARK: -

func hello(username: String) -> String {        // Function Type: (String) -> String
    return "저는 \(username)입니다."
}

func hello(nick: String, age: Int) -> String {  // Function Type: (String, Int) -> String
    return "저는 \(nick), \(age)살 입니다."
}

// 오버로딩 특성으로 함수를 구분하기 힘들 때, 타입 어노테이션을 통해 함수를 구별할 수 있다.
// 하지만 타입 어노테이션만으로 함수를 구별할 수 없는 상황도 있다.
// 함수 표기법을 사용한다면 타입 어노테이션을 생략하더라도 함수를 구별할 수 있다. - 매개변수로 구분
let result: (String) -> String = hello
result("고래밥")

let ageResult: (String, Int) -> String = hello
ageResult("고래밥", 33)

let result2 = hello(username: )



// MARK: 2. 함수의 반환 타입으로 함수를 사용할 수 있다.
func currentAccount() -> String {   // () -> String
    return "계좌 있음~~"
}

func noCurrentAccount() -> String { // () -> String
    return "계좌 없음!!"
}


func checkBank(bank: String) -> () -> String { // 가장 왼쪽에 위치한 -> 를 기준으로 오른쪽에 놓인 모든 타입은 반환값을 의미함
    let bankArray = ["우리", "신한", "국민"]
    return bankArray.contains(bank) ? currentAccount : noCurrentAccount // 함수를 호출하는 것은 아니고 함수를 던져줌!
}

let jack = checkBank(bank: "농협") // 함수 자체만 대입
jack()

checkBank(bank: "농협")()

// 2-1. Calculate
func plus(a: Int, b: Int) -> Int {     // (Int, Int) -> Int
    return a + b
}

func minus(a: Int, b: Int) -> Int {
    return a - b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

func divide(a: Int, b: Int) -> Int {
    return a / b
}

func calculate(operand: String) -> (Int, Int) -> Int {
    switch operand {
    case "+": return plus
    case "-": return minus
    case "*": return multiply
    case "/": return divide
    default: return plus
    }
}

calculate(operand: "+") // 함수가 실행되고 있는 상태가 아님.
calculate(operand: "+")(3, 5)
let calResult = calculate(operand: "-")
calResult(7, 4)


// MARK: 3. 함수의 인자값으로 함수를 사용할 수 있다.
// () -> ()
func oddNumber() {
    print("odd")
}

func evenNumber() {
    print("even")
}

func plusNumber() {
    
}

func minusNumber() {
    
}

// 어떤 함수가 들어가든 상관이 없고, 타입만 잘 맞으면 됨
// 실질적 연산이 인자값에 들어가는 함수에 달려 있어, 중개 역할만 담당하고 있어서 브로커라고 부름.
func resultNumber(number: Int, odd: () -> (), even: () -> ()) {
    return number.isMultiple(of: 2) ? even() : odd()
}

// 매개변수로 함수를 전달
resultNumber(number: 9, odd: oddNumber, even: evenNumber)
resultNumber(number: 10, odd: plusNumber, even: minusNumber) // 의도하지 않은 함수가 들어갈 수 있음. 필요 이상의 함수가 자꾸 생김.
// 타입만 맞으면 되니까 안에 함수를 넣으면 어떨까?
resultNumber(number: 11, odd: {
    print("홀수")
}, even: {
    print("짝수")
})
// 매개변수 안에 바로 실제적인 함수를 넣는 것 < 이름 없는 함수. 이름은 없지만 기능만 있음. MARK: 익명 함수
//resultNumber(number: Int) {
//    <#code#>
//} even: {
//    <#code#>
//}


/*
 클로저: 이름 없는 함수
 */

// () -> ()
func studyiOS() {
    print("주말 공부")
}

let studyiOSHarder: () -> () = {
    print("주말 공부")
}

// in을 기준으로 앞: 클로저 헤더, 뒤: 클로저 바디
// '클로저 헤더' in '클로저 바디'
let studyiOSHarder2 = { () -> () in
    print("주말 공부")
}

studyiOSHarder2()

// 인자값 안에 클로저
func getStudyWithMe(study: () -> () ) {
    print("getStudyWithMe")
    study() // 함수 호출 연산자(()) 붙여서 호출
}

// 코드를 생략하지 않고 클로저 구문 사용
// 함수의 매개변수 내에 클로저가 그대로 들어간 형태
// => 인라인(Inline) 클로저
getStudyWithMe(study: { () -> () in
    print("주말 공부")
})

// 함수 뒤에 클로저 실행
// => 트레일링(Trailing) 클로저 (후행 클로저)
getStudyWithMe() { () -> () in
    print("주말 공부")
} // 매개변수명 없어짐, 괄호 따로 처리


func example(number: Int) -> String {
    return "\(number)"
}

func randomNumber(result: (Int) -> String ) {
    result(Int.random(in: 1...100))
}

// 인라인 클로저
randomNumber(result: { (number: Int) -> String in
    return "행운의 숫자는 \(number)입니다."
})
// 같은 함수
randomNumber() {
    "행운의 숫자는 \($0)입니다." // 매개변수가 생략되면 할당되어있는 내부 상수 $0을 사용할 수 있다.
}

randomNumber {
    "\($0)"
}

randomNumber { _ in
    ""
}


// MARK: 고차함수: filter map reduce
func processTime(code: () -> () ) {
    let start = CFAbsoluteTimeGetCurrent()
    code()
    let end = CFAbsoluteTimeGetCurrent() - start
    print(end)
}

let student = [2.2, 4.5, 3.2, 4.9, 1.8, 3.2, 3.3, 4.0]

processTime {
    var newStudent: [Double] = []

    for student in student {
        if student >= 4.0 {
            newStudent.append(student)
        }
    }
}



// 4.0 이상인 학생 고르기

var newStudent: [Double] = []

for student in student {
    if student >= 4.0 {
        newStudent.append(student)
    }
}
print(newStudent)

let filterStudent = student.filter { value in
    value >= 4.0
}

let filterStudent2 = student.filter { $0 >= 4.0 } // 클로저 축약

print(filterStudent)

processTime {
    let filterStudent2 = student.filter { $0 >= 4.0 } // 클로저 축약

    print(filterStudent)
}


// map: 기존 요소를 클로저를 통해 원하는 결과값으로 변경
let number = [Int](1...100)
var newNumber: [Int] = []

for number in number {
    newNumber.append(number * 3)
}
print(newNumber)

let mapNumber = number.map { $0 * 3 } // map
print(newNumber)


let movieList = [
    "a": "A",
    "b": "B",
    "c": "C",
    "d": "D",
    "e": "E",
    "aaaaa": "A"
]

// 특정 감독의 영화만 출력
let movieResult = movieList.filter { $0.value == "A" }
print(movieResult)

// 영화 이름 배열로 변환
let movieResult2 = movieList.filter { $0.value == "A" }.map { $0.key }
print(movieResult2)


// reduce
let examScore: [Double] = [100, 20, 40, 77, 75, 91, 80, 95]
var totalCount: Double = 0

for score in examScore {
    totalCount += score
}
print(totalCount / 8)

let totalCountUsingReduce = examScore.reduce(0) { return $0 + $1 }
print(totalCountUsingReduce / 8)



// drawingGame: 외붛마수, luckyNumber: 내부함수
func drawingGame(item: Int) -> String {
    func luckyNumber(number: Int) -> String {
        return "\(number * Int.random(in: 1...10))"
    }
    
    let result = luckyNumber(number: item)
    
    return result
}
drawingGame(item: 10) // 외부함수의 생명주기가 끝났다 -> 내부함수의 생명주기도 끝났다!

// 내부함수를 반환하는 외부함수로 만들 수 있다.
func drawingGame2(item: Int) -> () -> String {
    func luckyNumber() -> String {
        return "\(item * Int.random(in: 1...10))"
    }
    
    return luckyNumber
}
drawingGame2(item: 10) // 내부함수는 아직 동작하지 않음.

let numberResult = drawingGame2(item: 10) // 아직 호출 안했으므로
numberResult() // 호출 연산자 필요함. 외부 함수의 생명주기가 끝났는데 내부함수는 사용이 가능한 상황이 됨.

// 은닉성()이 있는 내부 함수를 외부함수의 실행 결과로 반환하면서 내부함수를 외부에서도 접근 가능하게 되었음
// 이제 얼마든지 호출이 가능함. 이건 생명주기에도 영향을 미침. 외부함수가 종료되더라도 내부 함수는 살아있음

// 같은 정의를 갖는 함수가 서로 다른 환경을 저장하는 결과가 생기게 됨
// 클로저에 의해 내부 함수 주변의 지역변수나 상수도 함께 저장됨. -> 값이 캡쳐되었다고 표현함 => 캡쳐리스트 => 강한 순환 참조, 약한 순환 참조 등으로 해결 (weak, strong, unowned)
// 주변 환경에 포함된 변수나 상수의 타입이 기본 자료형이나 구조체 자료형일때 발생함. 클로저 캡쳐 기본 기능임





//: [Next](@next)
