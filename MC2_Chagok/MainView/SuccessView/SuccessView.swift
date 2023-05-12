//
//  SuccessView.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/12.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            TabView {
                LetterA()
                LetterB()
                LetterC()
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .scaledToFit()
            
            Button("보내기") {
                
            }
            .buttonStyle(.bordered)
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
