//
//  UserDataManager.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import Foundation

// MARK: Data Manager

/// User 구조체 생성
struct User: Codable, Identifiable {
    var id = UUID()
    var money: Int
    var message: String
    var date: Date
    var question: String
}

/// 클래스 생성
class UserData: ObservableObject {
    @Published var userdata: [User] = []
    @Published var total: Int = 0

    /// 데이터 업로드
    init() {
        loadData()
        updateTotal()
    }

    /// 데이터 save
    func save(_ message: String, _ money: Int, _ date: Date, _ question: String) {
        let newData = User(money: money, message: message, date: date, question: question)
        userdata.append(newData)
        saveData()
        updateTotal()
    }

    /// 데이터 delete
    func delete(at index: Int) {
        userdata.remove(at: index)
        saveData()
        updateTotal()
    }

    /// 객체를 JSON 형식으로 인코딩하여 UserDefaults에 저장
    /// User 타입의 객체 배열을 저장하기 위함
    private func saveData() {
        if let encodedData = try? JSONEncoder().encode(userdata) {
            UserDefaults.standard.set(encodedData, forKey: "userData")
            loadData()
            updateTotal()
        }
    }
    
    /// UserDefaults에서 "userData"라는 키를 사용하여 데이터를 로드하고, 이를 JSON 디코딩하여 User 타입의 객체 배열로 디코딩
    private func loadData() {
        if let data = UserDefaults.standard.data(forKey: "userData") {
            if let decodedData = try? JSONDecoder().decode([User].self, from: data) {
                userdata = decodedData
                updateTotal()
            }
        }
    }
    
    /// 총 돈을 얼마 모았는지 계산해주는 함수
    func updateTotal() {
        total = userdata.reduce(0, { $0 + $1.money })
    }
}

/// 가이딩 Question 구조체 생성
struct Question {
    
    var tyler: String
    var swift: String
    
    /// 혹시모르니 안전하게... nil 값을 방지. nill 값일때 기본값 Tyler, Swift
    init() {
        self.tyler = UserDefaults.standard.string(forKey: "Tyler") ?? "Tyler"
        self.swift = UserDefaults.standard.string(forKey: "Swift") ?? "Swift"
    }
    
    // MARK: Guiding Question by.Bently :)
    /// Tip: 그냥 chat-GPT한테 \(swift), \(tyler) 로 바꿔달라고 하면 쭉 바꿔줍니다.
    var question: [String] {
        [
            "\(swift)를 처음 만났을 때 나의 감정은?",
            "\(swift)의 어떤 점에 반하게 되었나요?",
            "\(swift)에게 배우고 싶은 점이 있나요?",
            "우리의 첫 데이트, 어땠는지 기억 나시나요?",
            "\(swift)를 만나기 전으로 돌아간다면?",
            "\(swift)에게 가장 부러운 것은?",
            "함께 시간 여행을 한다면 언제로 갈래요?",
            "만약 \(swift)와 몸이 바뀐다면?",
            "\(swift)와 보고 싶은 인생 영화",
            "올해에 \(swift)와 꼭 이루고 싶은 것",
            "지금 \(swift)와 어디든 갈 수 있다면?",
            "지금 \(swift)와 무엇이든 할 수 있다면?",
            "오래 함께하고 싶다는 생각이 든 순간",
            "\(swift)와 당장 하고 싶은 것은?",
            "함께 가고 싶은 우리 동네 맛집",
            "소개해주고 싶은 우리 동네 데이트코스",
            "\(swift)와 함께 살 집을 짓는다면?",
            "함께 하고 싶은 취미 활동이 있나요?",
            "함께 기르고 싶은 동물이 있나요?",
            "함께할 때 즐거운 일들을 나열해보세요!",
            "기념일엔 어떤 하루를 보내고 싶나요?",
            "만원으로 데이트를 해야한다면?",
            "당장 함께 밤을 새울 수 있나요?",
            "난 너가 ______ 할 때 가장 걱정돼!",
            "들었던 말 중 오래도록 기억에 남는 말",
            "그녀에게 어떤 사람이 되어주고 싶나요?",
            "\(tyler)에게는 요즘 어떤 고민들이 있나요?",
            "\(tyler)가 사랑하는 \(swift)를 자랑해보세요.",
            "분주한 하루를 보낸 \(swift)에게 한마디",
            "\(swift)에게 다시 한 번 반한 순간이 있다면?",
            "지금 이 순간을 빌려, 미안했던 일 사과하기",
            "그녀의 빈자리가 유독 크게 느껴질 때는?",
            "그녀를 만나 일어난 가장 큰 변화는?",
            "수많은 사람들 중 왜 그 사람인지 묻는다면?",
            "\"아, 이 사람이구나\" 확신을 느꼈던 순간",
            "나에게 힘이 되는 우리의 추억이 있나요?",
            "앞으로 너에게 () 하겠다고 약속할게!",
            "세상 모두가 \(swift)를 미워하게 된다면?",
            "그녀가 나에 대한 기억을 모두 잃는다면?",
            "넌 내가 ___ 할 때 보고 싶을 거야. 맞지?",
            "그녀의 스트레스가 치솟을 때 해줄 말",
            "우리는 이런 사랑을 하자! ___ 같은 사랑",
            "최근 그녀가 가장 보고싶었던 순간은?",
            "다시 만난 그녀에게 가장 먼저 건넬 말",
            "한 문장으로 \(swift)를 설레게 해주세요.",
            "소중한 \(swift)에게 꼭 전하고 싶은 말"
        ]
    }
}
