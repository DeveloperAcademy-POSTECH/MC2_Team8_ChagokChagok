//
//  SuccessPopupView.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/11.
//

import SwiftUI

struct SuccessPopupView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            TabView {
                Text("1")
                Text("1")
                Text("1")
                Text("1")
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(height: 200)
            
            
            Button("hello") {
                
            }
            .buttonStyle(.bordered)
        }
    }
}

struct Success_Previews: PreviewProvider {
    static var previews: some View {
        SuccessPopupView()
    }
}
