//
//  HomeView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct HomeView: View {
    
    @State var userData = UserData()
    @State var goalMoney = UserDefaults.standard.integer(forKey: "realGoalMoney")
    
    @State var navigateSaveMoneyView = false
    @State var randomQuestion = ""
    
    @State private var counter: Int = 0
    
    var body: some View {
        ZStack{
            Color.appBeige
                .ignoresSafeArea()
            VStack {
                postboxImageName(userData: userData, goalMoney: goalMoney)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 390)
//                VideoBackGroundView()
                
                /// 애니메이션
//                    .onTapGesture {
//                        counter += 1
//                    }
//                    .confettiCannon(counter: $counter)
                
                Spacer()
                Spacer()
                HomeCardView()
                Spacer()
                Spacer()
                Spacer()
                CustomButton(label: "채우기", disable: false) {
                    navigateSaveMoneyView = true
                    randomQuestion = Question().question.randomElement() ?? ""
                }
                .buttonStyle(.plain)
                .padding(.bottom)
                .padding(.bottom)
            }
        }
        .onAppear {
            userData = UserData()
            goalMoney = UserDefaults.standard.integer(forKey: "realGoalMoney")
        }
        .navigationDestination(isPresented: $navigateSaveMoneyView) {
            SaveMoneyView(navigateSaveMoneyView: $navigateSaveMoneyView, randomQuestion: $randomQuestion)
        }
    }
}

struct HomeCardView: View {
    
    @State var userData = UserData()
    @State var dday = Calculate.Dday(to: UserDefaults.standard.object(forKey: "realGoalDay") as? Date ?? Date())
    @State var goalMoney = UserDefaults.standard.integer(forKey: "realGoalMoney")
    
    var body: some View {
        
        let percent = goalMoney > 0 ? max(min((Double(userData.total) / Double(goalMoney)) * 100, 100), 0) : 0
        
        VStack(alignment: .center, spacing: 15) {
            HStack(alignment: .firstTextBaseline, spacing: 3){
                Text("\(userData.total)")
                    .font(.system(.largeTitle))
                    .bold()
                Text("원 채웠어요")
                    .font(.title)
                    .bold()
            }
            
            /// 기본 컴포넌트 Gauge 활용
            Gauge(value: percent/100, in: 0...1) {
            }
            .frame(width: 310, height: 16)
            .tint(Color.appPink)
            
            /// 글귀
            Text("편지를 보낼 날까지 **\(dday)일** 남았어요\n남은 **\((goalMoney-userData.total)/10000)만원** 도 힘내서 모아봐요")
                .multilineTextAlignment(.center)
        }
        .onAppear {
            userData = UserData()
            goalMoney = UserDefaults.standard.integer(forKey: "realGoalMoney")
            dday = Calculate.Dday(to: UserDefaults.standard.object(forKey: "realGoalDay") as? Date ?? Date())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
