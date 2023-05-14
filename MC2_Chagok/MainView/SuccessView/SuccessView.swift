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
    @State var userData = UserData()
    @State var question = Question()
    
    @Binding var navigateSuccessView: Bool
        
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("축하드려요!🎉\n\(UserDefaults.standard.string(forKey: "Swift") ?? "Swift")님에게 편지를 선물하세요")
                    .font(.title2)
                    .bold()
                    .padding(.top, 30)
                    .lineSpacing(5)
                    .frame(width: 320, alignment: .leading)
                TabView {
                        ForEach(userData.userdata.prefix(3)) { user in
                            if let index = question.question.firstIndex(of: user.question) {
                                if index % 2 == 0 {
                                    LetterC(user: user, imageC: index + 1)
                                        .fixedSize()
                                        .scaleEffect(0.5)
                                } else {
                                    HStack{
                                        LetterA(user: user, imageA: index + 1)
                                            .fixedSize()
                                            .scaleEffect(0.5)
                                    }
                                }
                            }
                        }

                }
                .frame(width: 300)
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .padding(.bottom)


                CustomButton(label: "앨범에 저장하기", disable: false) {
                    renderingSuccess = true
                    
                    /// 저장 기능
                    /// 앨범 생성
                    checkPhotoLibraryAuthorization {
                        createAlbum(albumName: "차곡차곡")
                    }
                    /// 배열 로직
                    for user in userData.userdata {
                        if let index = question.question.firstIndex(of: user.question) {
                            if index % 2 == 0 {
                                let renderer = ImageRenderer(content: LetterC(user: user, imageC: index + 1))
                                renderer.scale = 2
                                if let image = renderer.uiImage {
                                    saveImage(folderName: "첫번째 차곡", image: image, fileName: "\(index)")
                                    checkPhotoLibraryAuthorization {
                                        exportToAlbum(image: image, albumName: "차곡차곡")
                                    }
                                }
                            } else {
                                let renderer = ImageRenderer(content: LetterA(user: user, imageA: index + 1))
                                renderer.scale = 2
                                if let image = renderer.uiImage {
                                    saveImage(folderName: "첫번째 차곡", image: image, fileName: "\(index)")
                                    checkPhotoLibraryAuthorization {
                                        exportToAlbum(image: image, albumName: "차곡차곡")
                                    }
                                }
                            }
                        }
                    }

                    
                    
//                    for i in 0...4 {
//                        let renderer = ImageRenderer(content: Text("hello world"))
//                        renderer.scale = 2
//                        if let image = renderer.uiImage {
//                            saveImage(folderName: "첫번째 차곡",image: image, fileName: "\(i)")
//                            checkPhotoLibraryAuthorization {
//                                exportToAlbum(image: image, albumName: "차곡차곡")
//                            }
//                        }
//                    }
                }
                .padding(.vertical, 20)
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
