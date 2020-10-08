//
//  ContentView.swift
//  Stemo
//
//  Created by Brett Henderson on 10/8/20.
//  Copyright © 2020 Brett Henderson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                }
            }

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
