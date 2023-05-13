//
//  ContentView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct MainView: View {
    
    
    /// UITabBar 배경화면 베이지로 유지
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.appBeige)
    }
    
    @State var userData = UserData()
    @State var dday = Calculate.Dday(to: UserDefaults.standard.object(forKey: "realGoalDay") as? Date ?? Date())
    @State private var selection = 0
    
    
    var body: some View {
        
        /// TabView로 메인 페이지 구성
        ZStack {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem {
                        Text("홈")
                        Image(systemName: selection == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(0)
                PostboxView()
                    .tabItem {
                        Text("우체통 보기")
                        Image(systemName: selection == 1 ? "heart.text.square.fill" : "heart.text.square")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(1)
                LibraryView()
                    .tabItem {
                        Text("전송 기록")
                        Image(systemName: selection == 2 ? "folder.fill" : "folder")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(2)
            }
            .navigationBarBackButtonHidden()
            .background(Color.appBeige.ignoresSafeArea())
            .accentColor(.appRed)
            /// 뷰가 로드될 때마다 userData 업데이트
            .onAppear {
                userData = UserData()
            }
            .blur(radius: userData.total == UserDefaults.standard.integer(forKey: "realGoalMoney") ? 0.5 : 0)
            if userData.total == UserDefaults.standard.integer(forKey: "realGoalMoney") {
                SuccessPopUpView()
            }
            if dday < 0 && UserDefaults.standard.integer(forKey: "realGoalMoney") - userData.total > 0 {
                FailPopupView()
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
