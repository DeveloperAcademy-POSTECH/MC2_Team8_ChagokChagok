//
//  WhenAppStart.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct WhenAppStart: View {
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            /// 유저가 처음시작인지 체크를 위한 뷰
            let goalMoney = UserDefaults.standard.integer(forKey: "realGoalMoney")
            
            /// 유저가 시작할때 Goal을 정했는지 안했는지 체크
            if goalMoney > 0 {
                NavigationStack {
                    MainView()
                }
                .tint(.appRed)
            } else {
                UserRegistrationView()
            }
        }
    }
}

struct WhenAppStart_Previews: PreviewProvider {
    static var previews: some View {
        WhenAppStart()
    }
}

