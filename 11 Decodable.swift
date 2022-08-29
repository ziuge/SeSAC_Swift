import Foundation

// 서버 응답값을 변경해서 모델로 넣고 싶은 경우
// 서버에서 값을 3개 줬는데 2개만 받는 경우: 가능!
// 서버에서 값을 3개 줬는데 4개를 받는 경우 어떻게?

let json = """
{
"quote_content": "Count your age by friends, not years. Count your life by smiles, not tears.",
"author_name": null,
"like_count": 12345
}
"""

struct Quote: Decodable {
    let quote: String
    let author: String
    let like: Int
    let isInfluencer: Bool // 10000개 이상 좋아요 받은 경우
    
    enum CodingKeys: String, CodingKey { // 내부적으로 선언되어 있는 열거형
        case quote = "quote_content"
        case author = "author_name"
        case like = "like_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        quote = try container.decode(String.self, forKey: .quote)
        author = try container.decodeIfPresent(String.self, forKey: .author) ?? "unknown" // null이라면 unknown으로
        like = try container.decode(Int.self, forKey: .like)
        isInfluencer = (10000...).contains(like) ? true : false
    }
}

// MARK: String -> Data 형식으로 바꿔주기 -> Quote에 담아주기

// String -> Data
guard let result = json.data(using: .utf8) else { fatalError("ERROR")}

print(result)

// Data -> Quote
do {
    let value = try JSONDecoder().decode(Quote.self, from: result)
    print(value)
    print(value.quote)
    print(value.author)
} catch {
    print(error)
}
