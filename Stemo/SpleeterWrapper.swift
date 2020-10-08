//
//  SpleeterWrapper.swift
//  Stemo
//
//  Created by Brett Henderson on 10/8/20.
//  Copyright © 2020 Brett Henderson. All rights reserved.
//

import Foundation
import PythonKit

class SpleeterWrapper {
    
    static let sharedInstance = SpleeterWrapper()
    
    var spleeter: PythonObject? = nil
    var separator: PythonObject? = nil
    
    
    
    init() {
        //Setup python env
        let sys = Python.import("sys")
        
        print("Imported Python Version: " + sys.version)
            
        sys.path.append("/Users/bretthenderson/Developer/Stemo/Stemo/PythonLib/")
        spleeter = try? Python.attemptImport("spleeter")
//        separator = try? Python.attemptImport("spleeter.separator")
        guard self.spleeter != nil else { return }
        
//        guard self.separator != nil else { return }
        
        
        
        
        
    }
    
    func twoStems(input: String, outputPath: String) {
        
        let response = self.spleeter?.Separator.separate_to_file(input, outputPath)
//        let response = self.separator?.separate_to_file(input, outputPath)

        print(response!)
    }
}
