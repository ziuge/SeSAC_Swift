// SeSAC 함수 열거형 기초

import UIKit

func setNickname() -> Void {
    print("고래밥")
}

setNickname()

func setNicknameParameter(nickname: String) -> String {
    return "저는 \(nickname)입니다"
}

setNicknameParameter(nickname: "칙촉")

func getGameCharacter(name: String, age: Int) -> [String] {
    
    let character = ["도적", "도사", "주술사", "전사", "변호사"]
    let select = character.randomElement()!
    
    return [name, select]
    
}

var numberSet: Set = [2, 4, 6, 8, 10]
var numberSet2: Set = [1, 2, 3, 4, 5]

numberSet.subtracting(numberSet2) // 원본 안 건드림
numberSet.subtract(numberSet2) // 원본 건드림

let numberArray = [1, 2, 3, 4, 5,6 , 7, 8, 9, 10]

// appending
//numberArray.shuffle() // 섞기

//var notice = "온라인 라이브 수업은 \"Zoom\"으로 진행합니다."
//var notice = #"온라인 라이브 수업은 "Zoom"으로 진행합니다."#
var rawNotice = #"온라인 라이브 수업은 \#n \#nZoom으로 진행합니다."#
var onlineServie = "WhaleOn"
var notice = #"온라인 라이브 수업은 \#(onlineServie)으로 진행합니다."#

print(rawNotice)
print(notice)

