//
//  SaveAlertView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct SaveAlertView: View {
    
    /// 모든 값들을 바인딩 받아 최종 저장및 관리
    @Binding var navigateSaveMoneyView: Bool
    @Binding var navigateSaveMessageView: Bool
    @Binding var message: String
    @Binding var money: String
    @Binding var saveAlertView: Bool
    @Binding var randomQuestion: String
    
    /// 데이터 저장을 위한 userData 가져오기
    @State var userData = UserData()
    
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("\(Int(money) ?? 0)원과 편지를\n차곡차곡\n우체통에 채워둘게요!")
                    .font(.title)
                    .bold()
                    .padding(.top, 50)
                    .padding(.bottom, 10)
                Text("한 번 채우면 내용을 수정할 수 없어요")
                    .foregroundColor(.appRed)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .font(.title3)
                
                Spacer()
                Image("SaveAlert")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 100, alignment: .center)
                Spacer()
                
                // MARK: 아래 버튼
                
                VStack(spacing: 10) {
                    CustomBeigeButton(label: "다시보기", disable: false) {
                        saveAlertView = false
                    }
                    CustomButton(label: "채우기", disable: false) {
                        userData.save(message, Int(money) ?? 0, Date(), randomQuestion)
                        UserDefaults.standard.set(nil, forKey: "SavedMoney")
                        UserDefaults.standard.set(nil, forKey: "SavedMessage")
                        message = ""
                        money = ""
                        navigateSaveMoneyView = false
                        saveAlertView = false
                    }
                }
                .padding(.bottom, 30)
            }
        }
    }
}
