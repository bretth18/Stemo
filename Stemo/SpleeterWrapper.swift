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
    
    var spleet: PythonObject? = nil
    
    
    
    init() {
        //Setup python env
        let sys = Python.import("sys")
        
        print("Imported Python Version: " + sys.version)
            
        sys.path.append("/Users/bretthenderson/Developer/Stemo/Stemo/PythonLib/")
        spleet = try? Python.attemptImport("spleet")

        guard self.spleet != nil else { return }
        
        
//        guard self.separator != nil else { return }
        
        
        
        
        
        
        
    }
    
    func twoStems(stemAmount: Int, inputPath: String, outputPath: String) {
        
//        let response = self.spleeter?.twoStems(input, outputPath)
//        let response = self.spleeter?.separate.separate_to_file(input, outputPath)
//        self.separator = spleet?.initSeparator("2")
        self.spleet?.sepy(stemAmount, inputPath, outputPath)

        print(outputPath)
        
        
        
    }
}
