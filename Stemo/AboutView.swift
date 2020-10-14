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
        VStack {
            Text("copyright 2020, brett henderson")
                .font(.headline)
                .fontWeight(.bold)
            Text("COMPUTERDATA-DEV")
                .font(.subheadline)
                .fontWeight(.semibold)
            // RELEASE VERSION TEXT
            Text("release: \(releaseNumber)")
                .font(.footnote)
            
            // BUILD VERSION TEXT
            Text("build: \(buildNumber)")
                .font(.footnote)

        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
