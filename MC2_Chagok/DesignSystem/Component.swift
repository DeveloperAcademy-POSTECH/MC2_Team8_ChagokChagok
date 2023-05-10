//
//  Component.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct Component: View {
    
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("This is Custom Button")
            CustomButton(label: "Hello World", disable: false) {
            }
            
            Text("This is Custom LongButton")
            CustomLongButton(label: "Hello World", disable: false) {
                
            }
            
            Text("This is Custom TextField")
            CustomTextField(placeholder: "Hello World", text: $text, forKey: "Hello World")
            
            Text("This is custom small button")
            HStack {
                CustomSmallButton(label: "hello", disable: false, textColor: .appRed, backgroundColor: .appDarkBeige, shadowColor: Color(.systemGray4)) {
                    
                }
                CustomSmallButton(label: "hello", disable: false, textColor: .white, backgroundColor: .appRed, shadowColor: Color(.systemGray3)) {
                    
                }
            }
            HStack {
                CustomSmallRedButton(label: "Red") {
                }
                CustomSmallBeigeButton(label: "Beige") {
                }
                
            }
            
        }
    }
}

// MARK: HardCustomButton

struct HardCustomButton: View {
    var label: String
    var disable: Bool
    var action: () -> Void
    
    var body: some View {
        Rectangle()
            .frame(width: 330, height: 60)
    }
}

// MARK : CustomSmallButton

struct CustomSmallButton: View {
    
    var label: String
    var disable: Bool
    var textColor: Color
    var backgroundColor: Color
    var shadowColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .fontWeight(.semibold)
                .foregroundColor(textColor)
                .frame(width: 165, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(backgroundColor)
                        .shadow(color: shadowColor,radius: 5,y: 5)
                )

        }
        .buttonStyle(.plain)
        .disabled(disable)
    }
}

struct CustomSmallBeigeButton: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        CustomSmallButton(label: label, disable: false, textColor: .appRed, backgroundColor: .appDarkBeige, shadowColor: Color(.systemGray4), action: action)
    }
}

struct CustomSmallRedButton: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        CustomSmallButton(label: label, disable: false, textColor: .white, backgroundColor: .appRed, shadowColor: Color(.systemGray3), action: action)
    }
}

// MARK: CustomButton

struct CustomButton: View {
    
    var label: String
    var disable: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 330, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(disable ? Color(.systemGray3) : Color.appRed)
                        .shadow(color:Color(.systemGray3),radius: 5,y: 5)
                )
        }
        .buttonStyle(.plain)
        .disabled(disable)
    }
}

// MARK: CustomLongButton

struct CustomLongButton: View {
    var label: String
    var disable: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(disable ? Color(.systemGray3) : Color.appRed)
        }
        .buttonStyle(.plain)
        .disabled(disable)
    }
}

// MARK: CustomTextField

struct CustomTextField: View {
    
    var placeholder: String
    @Binding var text: String
    var forKey: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.horizontal)
            .foregroundColor(.black)
            .frame(width: 330, height: 60)
            .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .keyboardType(.numberPad)
            .onDisappear {
                UserDefaults.standard.set(text, forKey: forKey)
            }
            .onAppear {
                if let textFieldInput = UserDefaults.standard.string(forKey: forKey) {
                    text = textFieldInput
                }
            }
            .tint(.appRed)
    }
}



struct Component_Previews: PreviewProvider {
    static var previews: some View {
        Component()
    }
}
