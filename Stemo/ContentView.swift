//
//  ContentView.swift
//  Stemo
//
//  Created by Brett Henderson on 10/8/20.
//  Copyright © 2020 Brett Henderson. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    private let pageTitle = "stemo"
    
    @State var inputFileTextLabel = "please select a file"
    
    /// Move the main content to another View property, then modify it to add the navbar title (if needed) before returning it as body. When it's separated this way, conditional compilation can be used.
    
    /// macOS title bar complications
    #if !os(macOS)
    public var body: some View {
        main.navigationBarTitle(Text(pageTitle))
    }
    #else
    public var body: some View {
        main.frame(minWidth: 500, minHeight: 500).colorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
    #endif
    
    
    
    public var main: some View {
        
        
        VStack() {
            
            #if os(macOS)
                Text(pageTitle)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
            #endif
        
            
            Spacer()
            Text("This is the view content")
            Spacer()
            
            Button(action: inputFile) {
                Text("select input file")
            }
            
            // Label that displays current selected file path
            Text(inputFileTextLabel)
            
            
            HStack(alignment: .center) {
                Button(action: {}) {
                    Text("2 stems")
                }
                
                Button(action: {}) {
                    Text("4 stems")
                }
                
                Button(action: {}) {
                    Text("5 stems")
                }
            }

            
            Spacer()
            
            
        }
    }
    

    
 
    func callSplit() {
        
        let spleet = SpleeterWrapper()
        
        spleet.twoStems(stemAmount: 2,inputPath: "/Users/bretthenderson/Developer/Stemo/Stemo/TestAudio/SF.mp3", outputPath: "/Users/bretthenderson/Developer/Stemo/Stemo/TestAudio/Output/")
    }
    
    func inputFile() {
        let dialog = NSOpenPanel()
        dialog.title = "Select an audio file"
        dialog.showsResizeIndicator = true
        dialog.showsHiddenFiles = false
        dialog.allowsMultipleSelection = false
        dialog.canChooseDirectories = false
        dialog.allowedFileTypes = ["mp3", "wav", "aiff", "aif", "mp4"]
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            
            let result = dialog.url // FILE PATHNAME
            
            if (result != nil) {
                let path: String = result!.path
                
                print("file selected: \(path)")
                // Path ontains the file path (/Users/me/Desktop/Shit.mp3)
                
                //Update text label with current path
                self.inputFileTextLabel = path
            }
        } else {
            // user exited the dialog
            print("no file selected")
            return
        }

    }

}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
