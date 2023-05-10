//
//  UserInfoView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct UserInfoView: View {
    
    /// 텍스트 필드에 입력받는 변수
    /// tylerName과 swiftName을 입력받습니다. Userdefaults에 저장 예정입니다.
    @State private var tylerName: String = ""
    @State private var swiftName: String = ""
    
    /// 다음뷰로 넘어가기 위한 변수입니다 isPresented 에 넣어줍니다.
    @State private var navigateGoalSettingView = false
    
    /// 내 이름을 입력한 뒤에 스위프트 이름을 표시하기 위한 변수입니다.
    @State private var swiftNamePopup = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // MARK: 배경색 처리
                
                Color.appBeige.ignoresSafeArea()
                
                // MARK: 본격적인 뷰 시작
                
                VStack(alignment: .leading) {
                    
                    /// 최상단의 페이지 이름
                    Text(swiftNamePopup != true || tylerName.isEmpty ? "이름을 알려주세요" : "애인의 이름을 알려주세요")
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding(.top, 50)
                        .padding(.bottom, 10)
                    
                    
                    VStack {
                        if swiftNamePopup == true {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(!swiftName.isEmpty ? "애인 이름" : " ")
                                    .font(.caption2)
                                    .animation(.easeInOut(duration: 0.5), value: !swiftName.isEmpty)
                                TextField("애인 이름", text: $swiftName)
                                    .frame(width: 300, height: 50)
                                    .animation(.easeInOut(duration: 0.5), value: !swiftName.isEmpty)
                                    .animation(.easeOut(duration: 0.5), value: swiftNamePopup)
                                ZStack(alignment: .bottom) {
                                    Rectangle()
                                        .frame(width: 300, height: 2)
                                        .foregroundColor(Color(.systemGray5))
                                    Rectangle()
                                        .frame(width: (swiftName.isEmpty ? 0 : 300), height: 2)
                                        .foregroundColor(swiftName.isEmpty ? Color(.systemGray5) : .appRed)
                                        .animation(.easeInOut(duration: 0.5).delay(0.1), value: swiftName.isEmpty)
                                }
                            }
                            .animation(.easeOut(duration: 0.5), value: swiftNamePopup)
                        }
                        VStack(alignment: .leading, spacing: 0) {
                            Text(!tylerName.isEmpty ? "내 이름" : " ")
                                .font(.caption2)
                                .animation(.easeInOut(duration: 0.5), value: !tylerName.isEmpty)
                            TextField("내 이름", text: $tylerName)
                                .frame(width: 300, height: 50)
                                .animation(.easeOut(duration: 0.5), value: !tylerName.isEmpty)
                            ZStack(alignment: .bottom) {
                                Rectangle()
                                    .frame(width: 300, height: 2)
                                    .foregroundColor(Color(.systemGray5))
                                Rectangle()
                                    .frame(width: (tylerName.isEmpty ? 0 : 300), height: 2)
                                    .foregroundColor(tylerName.isEmpty ? Color(.systemGray5) : .appRed)
                                    .animation(.easeInOut(duration: 0.5).delay(0.1), value: tylerName.isEmpty)
                            }
                        }
                        .animation(.easeInOut(duration: 0.5), value: swiftNamePopup)
                        .animation(.easeInOut(duration: 0.5), value: !swiftName.isEmpty)
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
                        GoalSettingView(navigateGoalSettingView: $navigateGoalSettingView)
                    }
                }
            }
        }
        .tint(.appRed)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
