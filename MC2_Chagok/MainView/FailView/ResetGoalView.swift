//
//  UserGoalSettingAgainView.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/14.
//

import SwiftUI

struct ResetGoalView: View {
    @State private var goalMoney = ""
    @State private var goalDay = Date()
    @State private var showPicker = false
    @Binding var navigateSuccessView: Bool
    
    @State var resetGoalAlertView = false
    @Binding var navigateResetGoalView: Bool
    
    @FocusState var goalMoneyfocus: Bool
    
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("목표를 다시 설정해 주세요")
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
                    .fixedSize()
                    .frame(height: 50)
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
            
            /// 네비게이션 바 Back Button Custom
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        navigateResetGoalView = false
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
                        resetGoalAlertView = true
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
        
        .fullScreenCover(isPresented: $resetGoalAlertView) {
            ResetGoalAlertView(resetGoalAlertView: $resetGoalAlertView, navigateResetGoalView: $navigateResetGoalView, goalMoney: $goalMoney, goalDay: $goalDay, navigateSuccessView: $navigateSuccessView)
        }
    }
}

struct ResetGoalView_Previews: PreviewProvider {
    static var previews: some View {
        ResetGoalView(navigateSuccessView: .constant(true), navigateResetGoalView: .constant(true))
    }
}
