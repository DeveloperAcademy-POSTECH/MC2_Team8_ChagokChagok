//
//  SuccessView.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/12.
//

import SwiftUI

struct SuccessView: View {
    @State private var renderedImage: Image?
    @State private var renderingSuccess = false
    
    @Binding var navigateSuccessView: Bool
        
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            VStack {
                Text("축하드려요!\nSwift님에게 편지를 선물하세요")
                    .font(.title2)
                    .bold()
                    .padding(.vertical, 50)
                    .lineSpacing(5)
                    .frame(width: 320, alignment: .leading)
                    HStack {
                        Rectangle()
                            .frame(width: 200, height: 400)
                        Rectangle()
                            .frame(width: 200, height: 400)
                        Rectangle()
                            .frame(width: 200, height: 400)
                    }
                    .gesture(DragGesture()
                             
                    )
                CustomButton(label: "저장하기", disable: false) {
                    renderingSuccess = true
                    
                    /// 저장 기능
//                    checkPhotoLibraryAuthorization {
//                        createAlbum(albumName: "차곡차곡")
//                    }
//                    for i in 0...4 {
//                        let renderer = ImageRenderer(content: LetterC())
//                        renderer.scale = 2
//                        if let image = renderer.uiImage {
//                            saveImage(folderName: "첫번째 차곡",image: image, fileName: "\(i)")
//                            checkPhotoLibraryAuthorization {
//                                exportToAlbum(image: image, albumName: "차곡차곡")
//                            }
//                        }
//                    }
                }
                .padding(.bottom, 20)
            }
            .overlay {
                if renderingSuccess == true {
                    RenderingSuccess(navigateSuccessView: $navigateSuccessView)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    navigateSuccessView = false
                } label: {
                    Image(systemName: "chevron.backward")
                        .bold()
                }
            }
        }
    }
}

struct Success_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(navigateSuccessView: .constant(true))
    }
}
