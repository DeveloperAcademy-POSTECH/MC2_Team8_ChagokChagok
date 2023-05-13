//
//  LibraryView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct LibraryView: View {
    
    @State var animation = false
    @State var userData = UserData()
    
    var body: some View {
        ZStack {
            Color.appBeige
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("내가 목표 달성 기록들")
                        .font(.title)
                        .bold()
                        .padding(.top, 50)
                        .padding(.bottom, 1)
                    Text("차곡차곡 채워서 잠겨있는 기록들을 깨보세요!")
                        .padding(.bottom, 20)
                        .font(.callout)
                        .foregroundColor(.appGray)
                    ScrollView {
                        Text("우체통에 이만큼 채웠어요")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 330, alignment: .leading)
                        VStack (spacing: 3) {
                            ForEach(0..<2) { row in
                                HStack {
                                    ForEach(0..<3) { column in
                                        VStack(spacing: 0) {
                                            Image(openMoneyReward(column: column, row: row, usertotal: userData.total))
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110)
                                            
                                            /// 1, 2, 4, 7, 11, 16을 표현하기 위한 식
                                            Text("\((column + 1 + row * 3)*(column + 1 + row * 3 - 1) / 2 + 1)00만원")
                                                .foregroundColor(.appGray)
                                                .font(.callout)
                                        }
                                    }
                                }
                            }
                        }
                        Text("편지 묶음을 이만큼 보냈어요")
                            .fontWeight(.semibold)
                            .frame(width: 330, alignment: .leading)
                            .font(.title3)
                            .padding(.top)
                        VStack (spacing: 3) {
                            ForEach(0..<2) { row in
                                HStack {
                                    ForEach(0..<3) { column in
                                        VStack(spacing: 0) {
                                            Image("LockImage")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110)
                                            Text("\((column + 1 + row * 3)*(column + 1 + row * 3 - 1) / 2 + 1)통")
                                                .foregroundColor(.appGray)
                                                .font(.callout)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
