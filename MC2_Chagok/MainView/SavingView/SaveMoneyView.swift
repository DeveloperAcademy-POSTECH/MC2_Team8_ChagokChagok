//
//  SavingMoneyView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct SaveMoneyView: View {
    
    /// Navigation 관련된 변수
    @State var navigateSaveMessageView = false
    @Binding var navigateSaveMoneyView: Bool
    
    /// 텍스트필드 초기값 지정
    @State private var money: String = ""
    
    /// 금액과 관련된 버튼 Disable 변수
    @State private var disableButton = false
    
    /// 다음 SaveMessageView에 전달할 randomQuestion
    @Binding var randomQuestion: String
    
    /// 기존 저장된 값과 입력된 값을 저장하기 위한 UserData
    @State var goalMoney = UserDefaults.standard.integer(forKey: "realGoalMoney")
    @State var userData = UserData()
    
    @FocusState private var moneyFocus: Bool
            
    var body: some View {
        
        /// 실시간 받는 money 값을 사용하기 위한 변수, String으로 받아버렸기 때문에 옵셔널 채이닝 필요
        /// Int값으로 입력받고 싶었지만 문제가 발생했던 것으로 기억됨 -> 추후 해결 필요
        let savedMoney = Int(money) ?? 0
        
        ZStack {
            
            /// 배경설정
            Color.appBeige.ignoresSafeArea()
            
            // MARK: View 시작
            /// spacing을 일정하게 주고 싶었지만 ZStack이 들어가 있어 일정한 Spacing 조절이 힘들어 각각 조절
            VStack(alignment: .leading) {
                Text("오늘도 채워볼까요?")
                    .frame(width: 320, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding(.top, 50)
                    .padding(.bottom, 10)
                
                /// 텍스트필드와 애니메이션 영역
                TextField("", text: $money)
                    .focused($moneyFocus)
                    .foregroundColor(savedMoney > goalMoney ? .red : .black)
                    .frame(width: 320, height: 50)
                    .keyboardType(.numberPad)
                    .background(
                        Group {
                            Text("\(money)").foregroundColor(.clear)
                            + Text(" 원")
                        }
                            .opacity(money.isEmpty ? 0 : 1)
                            .animation(.easeInOut(duration: 0.3), value: money.isEmpty)
                        ,alignment: .leading
                    )
                    .background(
                        Text("채울 금액")
                            .foregroundColor(money.isEmpty ? Color(.systemGray4) : .gray)
                            .font(money.isEmpty ? .body : .callout)
                            .offset(y: money.isEmpty ? 0 : -30)
                            .opacity(money.isEmpty ? 1 : 0)
                            .animation(.easeInOut(duration: 0.3), value: money.isEmpty)
                        ,alignment: .leading
                    )
                    .background(
                        Text("채울 금액이 \(goalMoney - userData.total)원 남았어요")
                            .foregroundColor(money.isEmpty ? Color(.systemGray4) : .gray)
                            .font(money.isEmpty ? .body : .callout)
                            .offset(y: money.isEmpty ? 0 : -30)
                            .opacity(money.isEmpty ? 0 : 1)
                            .animation(.easeInOut(duration: 0.3), value: money.isEmpty)
                        ,alignment: .leading
                    )
                    .background(
                        Rectangle()
                            .frame(width: (money.isEmpty ? 0 : 320), height: 2)
                            .foregroundColor(money.isEmpty ? .clear : .appRed)
                            .animation(.easeInOut(duration: 0.5).delay(0.1), value: money.isEmpty)
                        ,alignment: .bottom
                    )
                    .background(
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(Color(.systemGray5))
                        ,alignment: .bottom
                    )
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.moneyFocus = true
                        }
                    }
                    .padding(.top)
                        
                
                /// 남은 금액 표시
                Text("남은 금액보다 높게 입력했어요")
                    .foregroundColor(savedMoney > goalMoney - userData.total ? .red : .appBeige)
                    .font(.caption2)
                    .padding(.top, 7)
                    .offset(y: savedMoney > goalMoney - userData.total ? 0 : 2)
                    .animation(.easeIn(duration: 0.3), value: savedMoney > goalMoney - userData.total)
                Spacer()
            }
            .navigationDestination(isPresented: $navigateSaveMessageView) {
                SaveMessageView(navigateSaveMoneyView: $navigateSaveMoneyView, navigateSaveMessageView: $navigateSaveMessageView, money: $money, randomQuestion: $randomQuestion)
            }
            .ignoresSafeArea(.keyboard)
            
            /// 네비게이션 BackButton Toolbar로 대체
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        navigateSaveMoneyView = false
                    } label: {
                        Image(systemName: "chevron.backward")
                            .bold()
                    }
                }
            }
            
            // MARK: Button
            
            VStack {
                Spacer()
                if !money.isEmpty {
                    CustomLongButton(label: "채우기", disable: money.isEmpty || (Int(money) ?? 0) <= 0 || (Int(money) ?? 0) > goalMoney - userData.total) {
                        navigateSaveMessageView = true
                    }
                }
            }
        }
        
        /// 뷰가 새롭게 리셋되어도 입력된 값을 그대로 유지하기 위한 설정
        .onDisappear {
            UserDefaults.standard.set(money, forKey: "SavedMoney")
        }
        .onAppear {
            if let SavedMoney = UserDefaults.standard.string(forKey: "SavedMoney") {
                money = SavedMoney
            }
        }
        /// userData 업데이트를 하기 위함
        .onAppear {
            userData = UserData()
        }
    }
}

struct SavingMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        SaveMoneyView(navigateSaveMoneyView: .constant(true), randomQuestion: .constant(""))
    }
}
