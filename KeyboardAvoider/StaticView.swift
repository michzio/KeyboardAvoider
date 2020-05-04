//
//  StaticView.swift
//  KeyboardAvoider
//
//  Created by Michal Ziobro on 04/05/2020.
//  Copyright © 2020 click5 Interactive. All rights reserved.
//

import SwiftUI

struct StaticView: View {
    
    @State var value1: String = ""
    @State var value2: String = ""
    
    @ObservedObject var avoider = KeyboardAvoider()
    
    var body: some View {
        
        KeyboardAvoiding(with: avoider) {
            VStack {
                Spacer()
                Text("Static View")
                Spacer()
                
                TextField("Field 1", text: self.$value1, onEditingChanged: { _ in
                    self.avoider.editingField = 1
                })
                .avoidKeyboard(tag: 1)
                
                TextField("Field 2", text: self.$value2, onEditingChanged: { _ in
                    self.avoider.editingField = 2
                })
                
                Button(action: {
                    
                }) {
                    Text("Tap!")
                }
                .avoidKeyboard(tag: 2)
            }
            .padding(16)
        }
    }
}

struct StaticView_Previews: PreviewProvider {
    static var previews: some View {
        StaticView()
    }
}
