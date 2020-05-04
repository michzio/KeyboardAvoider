//
//  ScrollableView.swift
//  KeyboardAvoider
//
//  Created by Michal Ziobro on 04/05/2020.
//  Copyright © 2020 click5 Interactive. All rights reserved.
//

import SwiftUI

struct ScrollableView: View {
    
    @State var value1: String = ""
    @State var value2: String = ""
       
    @ObservedObject var avoider = KeyboardAvoider()
    
    var body: some View {
       
        NavigationView {
            List {
                VStack(spacing: 8) {
                    ForEach(0..<15) { i in
                        Text("Text \(i)")
                    }
                    
                    TextField("Field 1", text: self.$value1, onEditingChanged: { _ in
                        self.avoider.editingField = 1
                    })
                    // additional offset if keyboard is hiding this text field!
                    //.offset(y: self.avoider.slideSize.height != 0 ? 20 : 0)
                    .avoidKeyboard(tag: 1)
                   
                    
                    TextField("Field 2", text: self.$value2)
                    
                }
            }
            .attachKeyboardAvoider(avoider, offset: 32)
            .padding(16)
            .registerKeyboardAvoider(avoider)
        }
        .navigationBarTitle("Test", displayMode: .inline)
    }
}

struct ScrollableView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableView()
    }
}
