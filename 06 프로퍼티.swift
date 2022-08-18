//: [Previous](@previous)

import UIKit

enum DrinkSize {
    case short, tall, grande, venti
}

class DrinkClass {
    let name: String
    var count: Int
    var size: DrinkSize
    
    // 클래스는 초기화 구문 필요!!
    init(name: String, count: Int, size: DrinkSize){
        self.name = name
        self.count = count
        self.size = size
    }
}

struct DrinkStruct {
    let name: String
    var count: Int
    var size: DrinkSize
}

let drinkClass = DrinkClass(name: "스무디", count: 2, size: .venti)
drinkClass.count = 5
drinkClass.size = .tall

print(drinkClass.name, drinkClass.count, drinkClass.size)

var drinkStruct = DrinkStruct(name: "스무디", count: 2, size: .grande)
drinkStruct.count = 10
drinkStruct.size = .venti

print(drinkStruct.name, drinkStruct.count, drinkStruct.size)


// 영화 타이틀, 러닝타임, 영상/화질좋은포스터 -> 필요한 시점에 초기화하기 위해서는? lazy
struct Poster {
    // 구조체를 인스턴스로 생성을 해야만, 그 인스턴스를 통해 image 프로퍼티에 접근 가능
    var image: UIImage = UIImage(named: "star") ?? UIImage()
    
    // 어떻게 init 초기화 구문 작성할 수 있나? -> 이미 모든 프로퍼티 초기화를 갖고 있기 때문에(image)
    // 멤버와이즈 이니셜라이저를 갖고 있지만, 추가적인 구현도 가능하다
    // 필요에 따라 초기화 구문을 여러 가지로 만들어서 사용할 수 있다
    // 메서드 오버로딩 특성을 활용해 하나의 초기화 구문인데 여러 구문인 것처럼 쓸 수도 있다
    init() {
        print("poster init")
    }
    
    init(defaultImage: UIImage) {
        self.image = defaultImage
    }
    
    init(customImage: UIImage? = UIImage(named: "star")) {
        self.image = customImage!
    }
}

// 인스턴스마다 image 프로퍼티가 다른 값을 가질 수 있다. 구조체는 값 타입이라서 저장되는 공간이 다르기 때문에.
var one = Poster()
var two = Poster()
var three = Poster()

struct MediaInfo {
    var mediaTitle: String
    var mediaRuntime: Int
    lazy var mediaPoster: Poster = Poster() // let으로 할 수 있을까?
    // let 은 값이 바뀌지 않는다. 상수는 인스턴스가 생성되기 전에 항상 값을 가지고 있어야 한다. 지연저장 프로퍼티가 처음으로 호출되어 사용되기 전에는 값이 nil이므로, lazy는 var이랑 짝이라고 생각하기!
}

var media = MediaInfo(mediaTitle: "우영우", mediaRuntime: 123)

// 100 중 1 play
media.mediaPoster // 저장을 지연시킴. 옵션. 초기화하기 부담되는 프로퍼티일 경우, 사용자가 정말 필요로 할 때야 비로소 메모리에 올려서 효율적으로 이용


// 타입 프로퍼티: lazy 키워드를 사용하지 않아도 나중에 초기화됨
struct User {
    static let name = "고래밥"
    static let age = 33
}

User.name // 호출하는 시점에 메모리에 올라간다. 호출하지 않으면 메모리에 올라가지 않는다.






//: [Next](@next)
