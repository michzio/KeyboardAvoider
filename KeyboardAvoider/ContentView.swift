//
//  ContentView.swift
//  KeyboardAvoider
//
//  Created by Michal Ziobro on 04/05/2020.
//  Copyright © 2020 click5 Interactive. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            StaticView()
                .tabItem { Text("Static") }
            ScrollableView()
                .tabItem { Text("Scrollable") }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
