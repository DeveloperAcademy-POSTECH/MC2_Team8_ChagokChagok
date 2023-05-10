//
//  UserAlertVieww.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct UserAlertView: View {
    
    @Binding var userAlertView: Bool
    @Binding var navigateContentView: Bool
    @Binding var goalMoney: String
    @Binding var goalDay: Date
    
    var body: some View {
        
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy년 MM월 dd일"
            return formatter
        }()
            ZStack {
                Color.appBeige.ignoresSafeArea()
                VStack(alignment: .leading) {
                    Spacer()
                    Spacer()
                    Text("\(dateFormatter.string(from: goalDay))까지\n\((Int(goalMoney) ?? 0)/10000)만원\n차곡차곡 쌓아봐요!")
                        .font(.title2)
                        .bold()
                    
                    Text("이 목표는 달성할 때까지 수정할 수 없어요")
                        .foregroundColor(.appRed)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Group {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    HStack {
                        CustomSmallBeigeButton(label: "다시보기") {
                            userAlertView = false
                        }
                        CustomSmallRedButton(label: "시작하기") {
                            navigateContentView = true
                            UserDefaults.standard.set(nil, forKey: "GoalMoney")
                            UserDefaults.standard.set(nil, forKey: "GoalDay")
                            
                            UserDefaults.standard.set(goalMoney, forKey: "realGoalMoney")
                            UserDefaults.standard.set(goalDay, forKey: "realGoalDay")
                            
                            goalMoney = ""
                            goalDay = Date()
                            userAlertView = false
                        }
                    }
                    Spacer()
                }
            }
    }
}

