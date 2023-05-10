//
//  GoalSettingView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct GoalSettingView: View {
    @State private var goalMoney = ""
    @State private var goalDay = Date()
    @State private var showPicker = false
    
    @State private var alert = false
    @State var userAlertView = false
    @State var navigateContentView = false
    @Binding var navigateGoalSettingView: Bool
    
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("달성할 목표를 알려주세요")
                    .frame(width: 320, alignment: .leading)
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding(.top, 50)
                    .padding(.bottom, 10)
                if goalDay.timeIntervalSinceNow > 0 {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(goalMoney.isEmpty ? " " : "목표 금액")
                            .font(.caption2)
                            .animation(.easeInOut(duration: 0.5), value: goalMoney.isEmpty)
                        TextField("목표 금액", text: $goalMoney)
                            .frame(width: 320, height: 50)
                            .keyboardType(.numberPad)
                            .animation(.easeInOut(duration: 0.5), value: goalDay.timeIntervalSinceNow > 0)
                        ZStack {
                            Rectangle()
                                .frame(width: 320, height: 2)
                                .foregroundColor(Color(.systemGray5))
                            Rectangle()
                                .frame(width: (goalMoney.isEmpty ? 0 : 320), height: 2)
                                .foregroundColor(goalMoney.isEmpty ? Color(.systemGray5) : .appRed)
                                .animation(.easeInOut(duration: 0.5).delay(0.1), value: goalMoney.isEmpty)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("목표 날짜")
                        .font(.caption2)
                    DatePicker(selection: $goalDay, in: Date.now..., displayedComponents: .date) {
                    }
                    .frame(width: 110, height: 50)
                }
                .animation(.easeInOut(duration: 0.5), value: goalDay.timeIntervalSinceNow > 0)
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            .frame(width: 340)
            .tint(.appRed)
            .navigationDestination(isPresented: $navigateContentView) {
                ContentView()
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        navigateGoalSettingView = false
                    } label: {
                        Image(systemName: "chevron.backward")
                            .bold()
                    }
                }
            }
            
            VStack {
                Spacer()
                if !goalMoney.isEmpty && Int(goalMoney) ?? 0 > 0 && goalDay.timeIntervalSinceNow > 0 {
                    CustomLongButton(label: "시작하기", disable: false) {
                        userAlertView = true
                    }
                }
            }
        }
        .onDisappear {
            UserDefaults.standard.set(goalMoney, forKey: "GoalMoney")
            UserDefaults.standard.set(goalDay, forKey: "GoalDay")
        }
        .onAppear {
            if let GoalMoney = UserDefaults.standard.string(forKey: "GoalMoney") {
                goalMoney = GoalMoney
            }
            if let GoalDay = UserDefaults.standard.object(forKey: "GoalDay") as? Date {
                goalDay = GoalDay
            }
        }
        .fullScreenCover(isPresented: $userAlertView) {
            UserAlertView(userAlertView: $userAlertView, navigateContentView: $navigateContentView, goalMoney: $goalMoney, goalDay: $goalDay)
        }
    }
}

struct GoalSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GoalSettingView(navigateGoalSettingView: .constant(true))
    }
}
