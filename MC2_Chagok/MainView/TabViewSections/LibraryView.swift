//
//  LibraryView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct LibraryView: View {
    
    var body: some View {
        ZStack {
            Color.appBeige
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("내가 목표 달성 기록들")
                        .font(.title2)
                        .bold()
                        .padding(.top, 30)
                        .padding(.bottom, 1)
                    Text("차곡차곡 채워서 잠겨있는 기록들을 깨보세요!")
                        .padding(.bottom, 20)
                        .font(.caption)
                        .foregroundColor(.appGray)
                    ScrollView {
                        Text("우체통에 이만큼 채웠어요")
                            .fontWeight(.semibold)
                            .frame(width: 330, alignment: .leading)
                        ForEach(0..<3) { row in
                            HStack {
                                ForEach(0..<3) { column in
                                    VStack(spacing: 0) {
                                        Image("LockImage")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 102)
                                        Text("\((column + 1 + row * 3))00만원 이상 채웠어요")
                                            .font(.system(size: 8))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        Text("편지 묶음을 이만큼 보냈어요")
                            .fontWeight(.semibold)
                            .frame(width: 330, alignment: .leading)
                            .padding(.top)
                        ForEach(0..<2) { row in
                            HStack {
                                ForEach(0..<3) { column in
                                    VStack(spacing: 0) {
                                        Image("LockImage")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 102)
                                        Text("\((column + 1 + row * 3))번 이상 보냈어요")
                                            .font(.system(size: 8))
                                            .foregroundColor(.gray)
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
