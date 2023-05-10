//
//  SaveMessageView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct SaveMessageView: View {
    
    /// 네비게이션을 위한 변수 바인딩
    @Binding var navigateSaveMoneyView: Bool
    @Binding var navigateSaveMessageView: Bool
    
    /// 텍스트필드에 입력받는 값을 저장하기 위함
    @State private var message = ""
    @Binding var money: String
    
    /// 최종 저장할때 확인하기위한 AlertView 띄우기
    @State var saveAlertView = false
    
    /// 홈뷰부터 새로 고쳐진 randomQuestion 값을 사용하기 위한 바인딩
    @Binding var randomQuestion: String
    
    
    var body: some View {
        ZStack {
            
            /// 배경 설정
            Color.appBeige
                .ignoresSafeArea()
            
            // MARK: View 시작
            /// spacing을 일정하게 주고 싶었지만 ZStack이 들어가 있어 일정한 Spacing 조절이 힘들어 각각 조절
            VStack(alignment: .leading) {
                Text("\(randomQuestion)")
                    .frame(width: 320, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding(.top, 50)
                    .padding(.bottom, 10)
                
                /// 텍스트 필드 뷰
                ZStack(alignment: .topTrailing) {
                    TextField("답변을 입력해주세요 (70자 이내)", text: $message, axis: .vertical)
                        .onChange(of: message) { newValue in
                            if message.count > 70 {
                                message = String(message.prefix(70))
                            }
                        }
                        .padding()
                        .foregroundColor(.black)
                        .frame(width: 320, height: 200)
                    /// 텍스트 필드의 프레임 설정
                        .background(
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .fill(message.isEmpty ? Color.appBeige : Color.appDarkBeige)
                                .shadow(color:Color(.systemGray3),radius: 5,y: 5)
                                .animation(.easeInOut(duration: 0.5), value: message.isEmpty)
                        )
                        .scrollContentBackground(.visible)
                    Text("\(message.count) / 70")
                        .foregroundColor(.gray)
                        .font(.caption2)
                        .padding()
                }
                .padding(.top)
                
                /// 뷰를 위로 밀기 위한 Spacer
                Spacer()
            }
            
            /// 키보드가 올라갔을 때 뷰가 안밀리기 위함
            .ignoresSafeArea(.keyboard)
            
            /// NaviagationBar 너무 구석에 붙어있어서 툴바 컴포넌트 활용
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        navigateSaveMessageView = false
                    } label: {
                        Image(systemName: "chevron.backward")
                            .bold()
                    }
                }
            }
            
            /// 메세지를 작성하고 작성완료 버튼 활성화 버튼 누를시 SaveAlertView 풀스크린 커버
            VStack {
                Spacer()
                if !message.isEmpty {
                    CustomLongButton(label: "작성완료", disable: message.isEmpty) {
                        saveAlertView = true
                    }
                }
            }
        }
        
        // MARK: FullScrrenCover 화면
        
        .fullScreenCover(isPresented: $saveAlertView) {
            SaveAlertView(navigateSaveMoneyView: $navigateSaveMoneyView, navigateSaveMessageView: $navigateSaveMessageView, message: $message, money: $money, saveAlertView: $saveAlertView, randomQuestion: $randomQuestion)
        }
        
        // MARK: 앞의 화면을 보고 돌아와도 메세지는 그대로 유지되게 유지하는 일시적인 UserDefaults
        
        .onDisappear {
            UserDefaults.standard.set(message, forKey: "SavedMessage")
        }
        .onAppear {
            if let SavedMessage = UserDefaults.standard.string(forKey: "SavedMessage") {
                message = SavedMessage
            }
        }
    }
}

// MARK: Preview를 위해 가장 긴 글을 그냥 가져옴

struct SaveMessageView_Previews: PreviewProvider {
    static var previews: some View {
        SaveMessageView(navigateSaveMoneyView: .constant(true), navigateSaveMessageView: .constant(true), money: .constant(""), randomQuestion: .constant("진심으로 미안했지만 제대로 사과하지 못했던 순간이 있나요? 지금 이 기회를 빌려, tyler의 진심을 전해주세요."))
    }
}
