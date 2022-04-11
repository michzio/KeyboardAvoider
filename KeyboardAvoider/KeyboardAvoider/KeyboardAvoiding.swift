//
//  KeyboardAvoiding.swift
//  CRM
//
//  Created by Michal Ziobro on 29/11/2019.
//  Copyright © 2019 Click 5 Interactive. All rights reserved.
//

import SwiftUI

struct KeyboardAvoiding<Content>: View where Content: View{
    
    @ObservedObject private var avoider : KeyboardAvoider
    
    let content: () -> Content
    let offset: CGFloat
    
    init(with avoider: KeyboardAvoider, offset: CGFloat = 0, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.avoider = avoider
        self.offset = offset
    }
    
    var body: some View {
        
        let isKeyboard = avoider.slideSize.height != 0
        
        return self.content()
            .offset(y: isKeyboard ? avoider.slideSize.height + offset : 0)
            .animation( avoider.isInitialized ? .easeInOut(duration: 1.0) : .none)
            .registerKeyboardAvoider(avoider)
    }
}

extension View {
    
    func registerKeyboardAvoider(_ avoider: KeyboardAvoider) -> some View {
        
        self.onPreferenceChange(KeyboardAvoiderPreferenceKey.self) { prefs in
            
            prefs.forEach { pref in
                debugPrint("Avoider Rect: \(pref.rect)")
                avoider.rects[pref.tag] = pref.rect
            }
        }
    }
}

struct KeyboardAvoiding_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardAvoiding(with: KeyboardAvoider()) {
            Text("Test")
        }
    }
}
