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
            VStack(alignment: .leading, spacing: 0) {
                Text("편지를 채워봐요")
                    .bold()
                    .font(.title)
                    .padding(.top)
                    .padding(.vertical)
                Text("\(randomQuestion)")
                    .frame(width: 330, alignment: .leading)
                    .fontWeight(.semibold)
                    .font(.title3)
                
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
                        .frame(width: 330, height: 200)
                    /// 텍스트 필드의 프레임 설정
                        .background(
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .fill(Color.appDarkBeige)
                                .shadow(color:Color(.systemGray5),radius: 5,y: 5)
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

struct SaveMessageView_Previews: PreviewProvider {
    static var previews: some View {
        SaveMessageView(navigateSaveMoneyView: .constant(true), navigateSaveMessageView: .constant(true), money: .constant(""), randomQuestion: .constant("최근에 그 사람이 가장 보고싶었던 순간은 언제인가요? → 만나서 그 사람에게 처음으로 건넬 말은 무엇인가요"))
    }
}
