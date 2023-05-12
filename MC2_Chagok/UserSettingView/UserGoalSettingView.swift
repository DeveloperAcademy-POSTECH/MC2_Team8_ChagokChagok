//
//  GoalSettingView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct UserGoalSettingView: View {
    @State private var goalMoney = ""
    @State private var goalDay = Date()
    @State private var showPicker = false
    
    @State private var alert = false
    @State var userAlertView = false
    @State var navigateContentView = false
    @Binding var navigateGoalSettingView: Bool
    
    @FocusState var goalMoneyfocus: Bool
    
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text(goalDay.timeIntervalSinceNow < 0 ? "언제까지 모아야 하나요?" : "얼마를 모아야 하나요?")
                    .frame(width: 320, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.top, 50)
                    .padding(.bottom, 10)
                VStack(alignment: .leading, spacing: 0) {
                    Text("목표 날짜")
                        .font(.callout)
                        .foregroundColor(.appGray)
                        .padding(.top)
                    DatePicker(selection: $goalDay, in: Date.now..., displayedComponents: .date) {
                    }
                    .frame(width: 110, height: 50)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 0) {
                    TextField("", text: $goalMoney)
                        .offset(x: Int(goalMoney) ?? 0 >= 1000 ? 3.5 : 0)
                        .offset(x: Int(goalMoney) ?? 0 >= 1000000 ? 3.5 : 0)
                        .offset(x: Int(goalMoney) ?? 0 >= 1000000000 ? 3.5 : 0)
                        .focused($goalMoneyfocus)
                        .foregroundColor(.clear)
                        .frame(width: 320, height: 40)
                        .keyboardType(.numberPad)
                        .animation(.easeInOut(duration: 0.5), value: goalDay.timeIntervalSinceNow > 0)
                        .background(
                            Text("\(Int(goalMoney) ?? 0) 원")
                                .opacity(goalMoney.isEmpty ? 0 : 1)
                                .animation(.easeInOut(duration: 0.3), value: goalMoney.isEmpty)
                            ,alignment: .leading
                        )
                        .background(
                            Text("목표 금액")
                                .foregroundColor(goalMoney.isEmpty ? Color(.systemGray4) : .appGray)
                                .font(goalMoney.isEmpty ? .body : .callout)
                                .offset(y: goalMoney.isEmpty ? 0 : -25)
                                .animation(.easeInOut(duration: 0.3), value: goalMoney.isEmpty)
                            ,alignment: .leading
                        )
                        .background(
                            Rectangle()
                                .frame(width: (goalMoney.isEmpty ? 0 : 320), height: 2)
                                .foregroundColor(goalMoney.isEmpty ? .clear : .appRed)
                                .animation(.easeInOut(duration: 0.5).delay(0.1), value: goalMoney.isEmpty)
                            ,alignment: .bottom
                        )
                        .background(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color(.systemGray5))
                            ,alignment: .bottom
                        )
                        .opacity(goalDay.timeIntervalSinceNow > 0 ? 1 : 0)
                        .offset(y : goalDay.timeIntervalSinceNow > 0 ? 0 : -20)
                        .animation(.easeInOut(duration: 0.5), value: goalDay.timeIntervalSinceNow > 0)
                }
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            .tint(.appRed)
            .navigationDestination(isPresented: $navigateContentView) {
                MainView()
            }
            
            /// 네비게이션 바 Back Button Custom
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
                        goalMoneyfocus = false
                    }
                }
            }
        }
        //        .onDisappear {
        //            UserDefaults.standard.set(goalMoney, forKey: "GoalMoney")
        //            UserDefaults.standard.set(goalDay, forKey: "GoalDay")
        //        }
        //        .onAppear {
        //            if let GoalMoney = UserDefaults.standard.string(forKey: "GoalMoney") {
        //                goalMoney = GoalMoney
        //            }
        //            if let GoalDay = UserDefaults.standard.object(forKey: "GoalDay") as? Date {
        //                goalDay = GoalDay
        //            }
        //        }
        
        // MARK: UserAlertView 창 띄우기
        
        .fullScreenCover(isPresented: $userAlertView) {
            UserAlertView(userAlertView: $userAlertView, navigateContentView: $navigateContentView, goalMoney: $goalMoney, goalDay: $goalDay)
        }
    }
}

struct UserGoalSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserGoalSettingView(navigateGoalSettingView: .constant(true))
    }
}
