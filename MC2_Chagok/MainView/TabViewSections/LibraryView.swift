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
                }
                .frame(width: 330, alignment: .leading)
                
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
