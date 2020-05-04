//
//  KeyboardAvoidingPreference.swift
//  CRM
//
//  Created by Michal Ziobro on 29/11/2019.
//  Copyright © 2019 Click 5 Interactive. All rights reserved.
//

import SwiftUI

// MARK: - Keyboard Avoiding Field Preference
struct KeyboardAvoiderPreference: Equatable {
    
    let tag: Int
    let rect: CGRect
    
    static func == (lhs: KeyboardAvoiderPreference, rhs: KeyboardAvoiderPreference) -> Bool {
        print("y: \(lhs.rect.minY) vs \(rhs.rect.minY)")
       return  lhs.tag == rhs.tag && (lhs.rect.minY == rhs.rect.minY)
    }
}

struct KeyboardAvoiderPreferenceKey: PreferenceKey {
    
    typealias Value = [KeyboardAvoiderPreference]
    
    static var defaultValue: [KeyboardAvoiderPreference] = []
    
    static func reduce(value: inout [KeyboardAvoiderPreference], nextValue: () -> [KeyboardAvoiderPreference]) {
         value.append(contentsOf: nextValue())
    }
}


struct KeyboardAvoiderPreferenceReader: ViewModifier {
    
    let tag: Int
    
    func body(content: Content) -> some View {
        
        content
            .background(
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.clear)
                        .preference(
                            key: KeyboardAvoiderPreferenceKey.self,
                            value: [
                                KeyboardAvoiderPreference(tag: self.tag, rect: geometry.frame(in: .global))
                        ])
                }
            )
    }
}

extension View {
    
    func avoidKeyboard(tag: Int) -> some View {
        self.modifier(KeyboardAvoiderPreferenceReader(tag: tag))
    }
    
    /* deprecated - change to view modifier struct
    func avoidKeyboard(tag: Int) -> some View {
        
        self.background(
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.clear)
                        .preference(
                            key: KeyboardAvoiderPreferenceKey.self,
                            value: [
                                KeyboardAvoiderPreference(tag: tag, rect: geometry.frame(in: .global))
                        ])
                }
        )
    }
    */
}
