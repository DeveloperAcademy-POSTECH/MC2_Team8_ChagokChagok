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
            VStack {
                VStack(alignment: .leading) {
                    Text("\(dateFormatter.string(from: goalDay))까지\n\((Int(goalMoney) ?? 0)/10000)만원\n차곡차곡 쌓아봐요!")
                        .font(.title)
                        .bold()
                        .padding(.top, 50)
                        .padding(.bottom, 10)
                    Text("이 목표는 달성할 때까지 수정할 수 없어요")
                        .font(.title3)
                        .foregroundColor(.appRed)
                        .fontWeight(.semibold)
                        .padding(.top)
                }
                .frame(width: 330, alignment: .leading)
                
                Spacer()
                Image("UserAlert")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 100, alignment: .center)
                Spacer()
                
                VStack(spacing: 10) {
                    CustomBeigeButton(label: "다시 설정하기", disable: false) {
                        userAlertView = false
                    }
                    
                    CustomButton(label: "시작하기", disable: false) {
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
                .padding(.bottom, 30)
                
            }
        }
    }
}

