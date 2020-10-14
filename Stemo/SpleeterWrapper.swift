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
            
//        sys.path.append("/Users/bretthenderson/Developer/Stemo/Stemo/PythonLib/")
        spleet = try? Python.attemptImport("spleeter")

        guard self.spleet != nil else { return }
        
        
//        guard self.separator != nil else { return }
        
        
    
        
    }
    
    
    /// NOTE: Implemented because i am still figuring out how to get PythonKit to work with Spleeter

    func shell(_ command: String) -> String {
        
        
        let task = Process()
        let pipe = Pipe()

        task.standardOutput = pipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/bash"
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!

        return output
    }


    
    func twoStems(stemAmount: Int, inputPath: String, outputPath: String) -> String {
        
//        let response = self.spleeter?.twoStems(input, outputPath)
//        self.separator = spleet?.initSeparator("2")

        let response = self.spleet?.separate.separate_to_file(inputPath, outputPath)
//        self.separator = spleet?.initSeparator("2")
//        self.spleet?.sepy(stemAmount, inputPath, outputPath)

        print(outputPath)
        
        return String(response!)!
        
        
    }
}
