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
            "\(swift)을 처음 마주했을 때 \(tyler)의 감정은 어땠는지 표현해주세요.",
            "당신은 \(swift)의 어떤 점에 반하게 되었나요?",
            "\(swift)에게 배우고 싶은 점이나 닮고 싶은 점이 있나요?",
            "풋풋했던 두 분의 첫 데이트, 어땠는지 기억 나시나요?",
            "현재의 기억을 가지고 그 사람과 만나기 전으로 돌아간다면?",
            "\(swift)이 가진 것 중 가장 부러운 것은 무엇인가요?",
            "함께 시간 여행을 한다면 언제로 떠나고 싶나요?",
            "현재의 기억을 가지고 그 사람과 만나기 전으로 돌아간다면?",
            "만약 지금 이 순간 연인과 몸이 바뀐다면 무엇을 할 것인가요?",
            "\(swift)와 함께 보고 싶은 당신의 인생 영화나 드라마가 있나요?",
            "올해가 가기 전 \(swift)와 꼭 이루고 싶은 것이 있나요?",
            "지금 \(swift)와 어디든 갈 수 있다면, 가장 가고 싶은 곳은 어디인가요?",
            "지금 \(swift)와 무엇이든 할 수 있다면, 가장 하고 싶은 것은 무엇인가요?",
            "이 사람과 오래오래 함께하고 싶다는 생각이 든 적 있나요? 있다면 언제인가요?",
            "언제 이 사람과 평생을 함께하고 싶다는 생각이 드나요?",
            "그 사람과 지금 당장 하고 싶은 것은 무엇일까요?",
            "\(swift)에게 꼭 소개해주고 싶은 우리 동네 맛집을 말해주세요.",
            "\(swift)에게 꼭 소개해주고 싶은 우리 동네 데이트장소를 말해주세요.",
            "두분이 함께 살 집을 짓는다면, 어디에 어떤 집을 지을지 상상해보세요.",
            "상대방과 함께 하고 싶은 취미활동이 있나요?",
            "\(swift)와(과) 함께 기르고 싶은 동물이 있나요? 있다면 그 이유는 무엇인가요?",
            "두 분이 함께할 때 즐거운 일들을 나열해보세요!",
            "그 사람과의 특별한 날에는 어떤 하루를 보내고 싶나요?",
            "만원으로 그 사람과 종일 데이트를 해야한다면 어떤 하루를 보낼 것인가요?",
            "오늘 바로! 그 사람과 밤새워 놀 수 있다면 무엇을 하고 싶나요?",
            "난 너가 ______ 할 때 가장 걱정돼!",
            "\(swift)가 했던 말 중 \(tyler)를 오래토록 설레게 한 말이 있나요?",
            "\(swift)에게 어떤 사람이 되어주고 싶나요?",
            "누구나 각자의 고민이 있습니다. \(tyler)는 요즘 어떤 고민이 있나요?",
            "당신이 사랑하는 그 사람을 자랑해보세요. 최대한 뻔뻔하게요.",
            "\(swift)에게 한 마디 할 수 있다면 분주한 하루를 보낸 \(swift)에게 한마디를 할 수 있다면?",
            "당신이 \(swift)에게 다시 한 번 반한 순간이 있다면?",
            "진심으로 미안했지만 제대로 사과하지 못했던 순간이 있나요? 지금 이 기회를 빌려, \(tyler)의 진심을 전해주세요.",
            "\(swift)의 빈자리가 유독 크게 느껴질 때는 언제인가요?",
            "\(swift)를 만나 \(tyler)에게 일어난 가장 큰 변화는 무엇인가요?",
            "수많은 사람들 중 왜 그 사람인지 묻는다면?",
            "아, 이 사람이구나 확신을 느꼈던 순간은 언제인가요?",
            "당신이 지쳤거나 외로울 때 힘이 되어주는 \(swift)와의 추억이 있나요?",
            "앞으로 너에게 ______ 하겠다고 약속할게!",
            "이 사람 모두가 그 사람을 미워하게 된다면 어떨까요?",
            "상대방이 당신에 대한 기억을 모두 잃는다면 어떨 것 같나요?",
            "아마 넌 내가 ______ 할 때 내가 가장 보고 싶을 거야. 맞지?",
            "상대방의 스트레스가 치솟을 때 당신이 해줄 수 있는 말은?",
            "우리는 이런 사랑을 하자! ____ 같은 사랑",
            "최근에 그 사람이 가장 보고싶었던 순간은 언제인가요?",
            "만나서 그 사람에게 처음으로 건넬 말은 무엇인가요",
            "한 문장으로 그 사람을 설레게 해주세요."
        ]
    }
}
