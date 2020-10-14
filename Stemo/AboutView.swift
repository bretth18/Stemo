//
//  AboutView.swift
//  Stemo
//
//  Created by Brett Henderson on 10/13/20.
//  Copyright © 2020 Brett Henderson. All rights reserved.
//
import Foundation
import SwiftUI


struct AboutView: View {
    
    public var releaseNumber: String = Bundle.main.releaseVersionNumberPretty
    public var buildNumber: String = Bundle.main.buildVersionNumberPretty
    
    var body: some View {
        HStack {
            // RELEASE VERSION TEXT
            Text("release: \(releaseNumber)")
            
            // BUILD VERSION TEXT
            Text("build: \(buildNumber)")

        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
