//: [Previous](@previous)

import UIKit

/*
 Meta type: 클래스, 구조체, 열거형 유형 그 자체를 가리킴
 String 타입은 String.Type
 */


struct User {
    let name = "고래밥" // 인스턴스 프로퍼티
    static let originalName = "jack" // 타입 프로퍼티
}

let user = User() // 인스턴스로 name은 호출 가능, originalName은 호출 불가능
user.name

User.originalName
User.self.originalName

type(of: user.name) // "고래밥" - String Value, user.name String 타입의 인스턴스, String은 String.Type

type(of: user)

let intValue: Int = 9.self // Int 타입은 사실 구조체 Int의 인스턴스이다.
let intType: Int.Type = Int.self




/*
 try!
 Swift Error Handlilng
 */

enum ValidationError: Error {
    case emptyString
    case isNotInt
    case isNotDate
    case callLimit
    case serverError
}

// 들어온 값이 숫자이면 true, 그게 아니면 false
func validateUserInput(text: String) throws -> Bool {
    // 입력한 값이 비었는지
    guard !(text.isEmpty) else {
        throw ValidationError.emptyString
    }
    
    // 입력한 값이 숫자인지 아닌지
    guard Int(text) != nil else {
        throw ValidationError.isNotInt
    }
    
    return true
}

do {
    
    try validateUserInput(text: "20200202")
    print("성공!")
    
} catch ValidationError.emptyString {
    print("EMPTY")
} catch ValidationError.isNotInt {
    print("ISNOTINT")
} catch {
    print("ERROR")
}


//: [Next](@next)
