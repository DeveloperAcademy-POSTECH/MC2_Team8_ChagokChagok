//
//  ResetGoalAlertView.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/14.
//

import SwiftUI

struct ResetGoalAlertView: View {
    @Binding var resetGoalAlertView: Bool
    @Binding var navigateResetGoalView: Bool
    @Binding var goalMoney: String
    @Binding var goalDay: Date
    @Binding var navigateSuccessView: Bool
    
    @State private var goalClearCount: Int = UserDefaults.standard.integer(forKey: "GoalClearCount")
    @State private var allTotalMoney: Int = UserDefaults.standard.integer(forKey: "AllTotalMoney")
    
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
                    .frame(width: 330, height: 130, alignment: .center)
                Spacer()
                
                VStack(spacing: 10) {
                    CustomBeigeButton(label: "다시보기", disable: false) {
                        resetGoalAlertView = false
                    }
                    
                    CustomButton(label: "시작하기", disable: false) {
                        navigateResetGoalView = false
                        navigateSuccessView = false
                        UserDefaults.standard.set(nil, forKey: "GoalMoney")
                        UserDefaults.standard.set(nil, forKey: "GoalDay")

                        UserDefaults.standard.set(goalMoney, forKey: "realGoalMoney")
                        UserDefaults.standard.set(goalDay, forKey: "realGoalDay")
                        
                        goalMoney = ""
                        goalDay = Date()
                        resetGoalAlertView = false
                        
                        allTotalMoney += UserDefaults.standard.integer(forKey: "AllTotalMoney")
                        UserDefaults.standard.set(allTotalMoney, forKey: "AllTotalMoney")
                        
                        goalClearCount += 1
                        UserDefaults.standard.set(goalClearCount, forKey: "GoalClearCount")
                        
                        UserDefaults.standard.removeObject(forKey: "userData")
                    }
                }
                .padding(.bottom, 30)
                
            }
        }
    }
}
