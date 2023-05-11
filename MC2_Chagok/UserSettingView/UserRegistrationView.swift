//
//  UserInfoView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct UserRegistrationView: View {
    
    /// 텍스트 필드에 입력받는 변수
    /// tylerName과 swiftName을 입력받습니다. Userdefaults에 저장 예정입니다.
    @State private var tylerName: String = ""
    @State private var swiftName: String = ""
    
    /// 다음뷰로 넘어가기 위한 변수입니다 isPresented 에 넣어줍니다.
    @State private var navigateGoalSettingView = false
    
    /// 내 이름을 입력한 뒤에 스위프트 이름을 표시하기 위한 변수입니다.
    @State private var swiftNamePopup = false
    
    @FocusState private var tylernameFocus: Bool
    @FocusState private var swiftnameFocus: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                /// 배경색
                Color.appBeige.ignoresSafeArea()
                
                // MARK: 본격적인 뷰 시작
                
                VStack(alignment: .leading) {
                    
                    /// 최상단의 페이지 이름
                    Text(swiftNamePopup != true || tylerName.isEmpty ? "이름을 알려주세요" : "애인의 이름을 알려주세요")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.top, 95)
                        .padding(.bottom, 10)
                    
                    
                    VStack {
                        
                        /// 내이름 입력란
                        TextField("", text: $tylerName)
                            .focused($tylernameFocus)
                            .frame(width: 320, height: 40)
                            .background(
                                Text("내 이름")
                                    .foregroundColor(tylerName.isEmpty ? Color(.systemGray4) : .gray)
                                    .font(tylerName.isEmpty ? .body : .caption)
                                    .offset(y: tylerName.isEmpty ? 0 : -20)
                                    .animation(.easeInOut(duration: 0.3), value: tylerName.isEmpty)
                                ,alignment: .leading
                            )
                            .background(
                                Rectangle()
                                    .frame(width: (tylerName.isEmpty ? 0 : 320), height: 2)
                                    .foregroundColor(tylerName.isEmpty ? .clear : .appRed)
                                    .animation(.easeInOut(duration: 0.5).delay(0.1), value: tylerName.isEmpty)
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
                                    self.tylernameFocus = true
                                }
                            }
                            .padding(.vertical)
                        
                        /// 애인 이름 입력란
                        TextField("", text: $swiftName)
                            .focused($swiftnameFocus)
                            .frame(width: 320, height: 40)
                            .background(
                                Text("애인 이름")
                                    .foregroundColor(swiftName.isEmpty ? Color(.systemGray4) : .gray)
                                    .font(swiftName.isEmpty ? .body : .caption)
                                    .offset(y: swiftName.isEmpty ? 0 : -20)
                                    .animation(.easeInOut(duration: 0.3), value: swiftName.isEmpty)
                                ,alignment: .leading
                            )
                            .background(
                                Rectangle()
                                    .frame(width: (swiftName.isEmpty ? 0 : 320), height: 2)
                                    .foregroundColor(swiftName.isEmpty ? .clear : .appRed)
                                    .animation(.easeInOut(duration: 0.5).delay(0.1), value: swiftName.isEmpty)
                                ,alignment: .bottom
                            )
                            .background(
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(Color(.systemGray5))
                                ,alignment: .bottom
                            )
                            .opacity(swiftNamePopup == true ? 1 : 0)
                            .offset(y : swiftNamePopup == true ? 0 : -30)
                            .animation(.easeInOut(duration: 0.5), value: swiftNamePopup == true)
                        Spacer()
                    }
                }
                .ignoresSafeArea(.keyboard)
                
                // MARK: 다음으로 넘어가는 Button
                
                VStack {
                    Spacer()
                    ZStack {
                        if !tylerName.isEmpty && swiftName.isEmpty && swiftNamePopup == false {
                            CustomLongButton(label: "확인", disable: false) {
                                swiftNamePopup = true
                                swiftnameFocus = true
                            }
                        }
                        
                        if !swiftName.isEmpty && !tylerName.isEmpty {
                            CustomLongButton(label: "다음", disable: false) {
                                navigateGoalSettingView = true
                                UserDefaults.standard.set(tylerName, forKey: "Tyler")
                                UserDefaults.standard.set(swiftName, forKey: "Swift")
                            }
                        }
                    }
                    .ignoresSafeArea()
                    .navigationDestination(isPresented: $navigateGoalSettingView) {
                        UserGoalSettingView(navigateGoalSettingView: $navigateGoalSettingView)
                    }
                }
            }
        }
        .tint(.appRed)
    }
}

struct UserRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationView()
    }
}
