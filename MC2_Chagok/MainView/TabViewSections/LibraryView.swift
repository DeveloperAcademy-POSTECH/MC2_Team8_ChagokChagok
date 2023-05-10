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
                    Text("내가 모은 우표들")
                        .font(.title2)
                        .bold()
                        .padding(.top, 30)
                        .padding(.bottom, 1)
                    Text("목표를 달성하면 우표를 받을 수 있어요")
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
