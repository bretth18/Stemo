//
//  AppDelegate.swift
//  Stemo
//
//  Created by Brett Henderson on 10/8/20.
//  Copyright © 2020 Brett Henderson. All rights reserved.
//

import Cocoa
import SwiftUI
import PythonKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        
        // Python test
        
//        let sys = Python.import("sys")
//        
//    sys.path.append("/Users/bretthenderson/Developer/Stemo/Stemo/PythonLib/")
//        
//        let example = Python.import("spleet")
//        
//        example.hello()
        
        
        let spleet = SpleeterWrapper()
        
        spleet.twoStems(input: "/Users/bretthenderson/Developer/Stemo/Stemo/TestAudio/SF.mp3", outputPath: "/Users/bretthenderson/Developer/Stemo/Stemo/TestAudio/Output/")
        
        
//        var spleeter: PythonObject? = nil
//        
//        spleeter = try? Python.attemptImport("spleeter")
//        
//        print(spleeter)
        
//        example.twoStems("/Users/bretthenderson/Developer/Stemo/Stemo/TestAudio/SF.mp3", "/Users/bretthenderson/Developer/Stemo/Stemo/TestAudio/Output/")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

