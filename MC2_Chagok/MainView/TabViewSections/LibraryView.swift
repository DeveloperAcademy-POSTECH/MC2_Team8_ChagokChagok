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
                    Text("목표를 달성하면 편지에 붙일 우표를 드려요")
                        .padding(.bottom, 20)
                        .font(.caption)
                        .foregroundColor(.appGray)
                }
                ScrollView {
                    VStack {
                        ForEach(0..<3) {_ in
                            LibraryCard()
                                .padding(.bottom)
                                .frame(width: 380)
                        }
                    }
                    .frame(width: 336)
                }
            }
        }
    }
}

struct LibraryCard: View {
    @State var navigateLibraryDetailView = false
    
    var body: some View {
        
        Button {
            navigateLibraryDetailView = true
        } label: {
            Text("This is Library View")
                .foregroundColor(.black)
                .frame(width: 340, height: 100)
                .background(.regularMaterial, in : RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .navigationDestination(isPresented: $navigateLibraryDetailView) {
            LibraryDetailView(navigateLibraryDetailView: $navigateLibraryDetailView)
        }
    }
}

struct LibraryDetailView: View {
    @Binding var navigateLibraryDetailView: Bool
    
    var body: some View {
        ZStack {
            Color.appBeige
                .ignoresSafeArea()
            VStack{
                Text("Library Detail View")
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        navigateLibraryDetailView = false
                    } label: {
                        Image(systemName: "chevron.backward")
                            .bold()
                    }
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}