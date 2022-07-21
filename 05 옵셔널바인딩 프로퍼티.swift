//: [Previous](@previous)

import Foundation

// MARK: - 1. 옵셔널 바인딩

// ex. 쇼핑 리스트 추가
var shoplist: String? = "신발 사기"
var shoplist2: String? = "모니터 사기"

// 강제 해제 연산자
if shoplist != nil && shoplist2 != nil {
    // 변수 개수만큼 강제 해제 해야함 -> 별로 안전하지도 편리하지도 않음
    print("\(shoplist!) 완료!")
} else {
    print("글자를 입력해주세요")
}

// 만약 2글자 이상을 꼭 입력해야 한다면?

shoplist = nil

// ex. Jackflix 2글자 이상 6글자 이하일 때
if let jack = shoplist, let value = shoplist2, (2...6).contains(jack.count) {
    // shoplist: optional string type -> jack이라는 조건문 내에서만 사용하는 변수 사용 : 이친구는 옵셔널이 해제됨! // let jack: String
    print("\(jack)")
    // 조건문 내의 변수를 밖에서 사용하지 못함
} else { // nil일 경우
    print("글자를 입력해주세요")
}

// guard
// else 구문에 대한 것만 선언되어 있음, 변수의 scope가 함수 안임
func optionalBindingFunc() {
    guard let jack = shoplist, let value = shoplist2, (2...6).contains(jack.count) else {
        print("글자를 입력해주세요 guard")
        return
    }
    
    print("\(jack) 완료! guard")
}


// MARK: - 2. 인스턴스 프로퍼티 vs 타입 프로퍼티

class User {
    var nickname = "고래밥" // 저장 프로퍼티, 인스턴스 프로퍼티
    
    // 어차피 똑같은 nickname = "고래밥" 쓸 거면 같은 곳에서 저장된 걸로 써 -> 메모리에서 한 군데에만 저장됨
    // 인스턴스를 만들지 않고, 타입의 하나의 요소라고 간주
    static var staticNickname = "고래밥밥" // 저장 프로퍼티, 타입 프로퍼티
}

let user = User() // 인스턴스 생성
user.nickname

// 호출 시 메모리에 올라감. 인스턴스를 생성한다고 해서 초기화가 되지 않고, 사용할 때 초기화가 된다.
// 앱을 실행하는 내내 한 공간에 남아 있음
User.staticNickname // User에 바로 접근 가능

// 반대로 인스턴스 프로퍼티는 인스턴스 생성할 때 잠깐 올라왔다가 사라지게 됨



//: [Next](@next)
