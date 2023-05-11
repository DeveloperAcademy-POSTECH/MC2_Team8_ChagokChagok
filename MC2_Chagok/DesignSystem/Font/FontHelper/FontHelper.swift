//
//  FontHelper.swift
//  MC2_RaisingTyler@Bentley
//
//  Created by Kim Yejoon on 2023/05/09.
//

import SwiftUI

public struct CustomFontManager {
    public static func registerFonts(fontName: String) {
        registerFont(bundle: Bundle.main , fontName: fontName, fontExtension: ".ttf")
    }
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data!!!")
        }

        var error: Unmanaged<CFError>?

        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
