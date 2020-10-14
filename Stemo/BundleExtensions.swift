//
//  BundleExtensions.swift
//  Stemo
//
//  Created by Brett Henderson on 10/13/20.
//  Copyright © 2020 Brett Henderson. All rights reserved.
//

import Foundation


extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    var releaseVersionNumberPretty: String {
        return "v\(releaseVersionNumber ?? "0.0.1")"
    }
    
    var buildVersionNumberPretty: String {
        return "v\(buildVersionNumber ?? "0.0.0")"
    }
}
