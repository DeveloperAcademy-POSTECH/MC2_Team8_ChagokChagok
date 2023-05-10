//
//  ContentView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    
    /// UITabBar 배경화면 베이지로 유지
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.appBeige)
    }
    
    @State var userData = UserData()
    @State private var selection = 0
    
    /// TabView로 메인 페이지 구성
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem {
                        Text("홈")
                        Image(systemName: selection == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(0)
                MessageView()
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
            .fontDesign(.rounded)
            
            /// 뷰가 로드될 때마다 userData 업데이트
            .onAppear {
                userData = UserData()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
