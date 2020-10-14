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
    private let buildInfo = "dev 0.0.1"
    
    /// State variables for text labels.
    @State var inputFileTextLabel = "please select a file"
    @State var outputDirectoryTextLabel = "no output directory selected"
    @State var consoleOutput = "console log "
    
    /// State variables for boolean values
    @State var inputFileSelected = false
    @State var outputDirectorySelected = false
    @State var operationInProgress = false
    @State var showAlert = false
    
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
    
    
    // Alert popup
    var alertPopup: Alert {
        Alert(title: Text("Stinky!"), message: Text("input/output path not selected"),
                                     dismissButton: .default(Text("Dismiss")))
    }
    
    
    
    
    
    public var main: some View {
        
        
        VStack() {
            
            
            #if os(macOS)
                Text(pageTitle)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
            
                

            #endif
            
            VStack() {
                Spacer()
                         
                         
                
                         AnimationView()
                             .frame(height: 100)
                             .padding(.bottom, 5.0)

                         Spacer()
                         
                         Button(action: inputFile) {
                             Text("select input file")
                         }
                         
                         // Label that displays current selected file path
                         Text(inputFileTextLabel)
                         
                         
                         
                         Button(action: outputFile) {
                             Text("select output file(s) directory")
                         }
                         Text(outputDirectoryTextLabel)
                         
                         
                         HStack(alignment: .center) {
                             Button(action: {
                                 self.callSplit(stemCount: 2) }) {
                                 Text("2 stems")
                             }
                             .alert(isPresented: $showAlert, content: {self.alertPopup})
                             
                             
                             Button(action: { self.callSplit(stemCount: 4)}) {
                                 Text("4 stems")
                             }
                             .alert(isPresented: $showAlert, content: {self.alertPopup})
                             
                             
                             Button(action: { self.callSplit(stemCount: 5)}) {
                                 Text("5 stems")
                             }
                             .alert(isPresented: $showAlert, content: {self.alertPopup})
                         }
                         
                         VStack() {
                             Text(consoleOutput)
                         }
                         
                         
                         Spacer()
                         
            }
            
  
            
 
            
            
        }
        
        
        
    }
    

    
    // function callSplit takes an input parameter for stem count
    func callSplit(stemCount: Int) {
        
        let spleet = SpleeterWrapper()
        
        if (inputFileSelected == true && outputDirectorySelected == true) {
            
            // store directory in local val to pass
            let inputFileDirectory = inputFileTextLabel
            let outputFileDirectory = outputDirectoryTextLabel
            
            // call spleeter actions
            self.consoleOutput = spleet.twoStems(stemAmount: stemCount, inputPath: inputFileDirectory, outputPath: outputFileDirectory)
            
            
            
//            /// NOTE: Temporary workaround to just launch spleeter via bash, proper pythonKit integration needs to be done.
//            self.consoleOutput = spleet.shell("spleeter separate -i \(inputFileDirectory) -p spleeter:\(stemCount)stems -o \(outputFileDirectory)")
//
            
        } else if (inputFileSelected == true && outputDirectorySelected == false) {
            
            // prompt warning pop up
            self.showAlert = true
            print("ERR: NO OUTPUT PATH SELECTED")
            return
            
        } else {
            
            //prompt
            self.showAlert = true
            print("ERR: NO INPUT & OUTPUT PATH SELECTED")
            return
        }
        

    }
    
    //    inputFile() presents a finder view to select an audio file
    func inputFile() {
        let dialog = NSOpenPanel()
        dialog.title = "Select an audio file"
        dialog.showsResizeIndicator = true
        dialog.showsHiddenFiles = false
        dialog.allowsMultipleSelection = false
        dialog.canChooseDirectories = false
        
        // Only allow audio file types
        dialog.allowedFileTypes = ["mp3", "wav", "aiff", "aif", "mp4"]
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            
            let result = dialog.url // FILE PATHNAME
            
            if (result != nil) {
                let path: String = result!.path
                
                print("file selected: \(path)")
                // Path ontains the file path (/Users/me/Desktop/Shit.mp3)
                
                // Update text label with current path
                self.inputFileTextLabel = path
                
                // Update Boolean value
                self.inputFileSelected = true
            }
        } else {
            // user exited the dialog
            print("no file selected")
            return
        }

    }
    
    // outputFile presents a finder view to select the output path directory for the rendered stems(s).
    func outputFile() {
        
        let dialog = NSOpenPanel()
        dialog.title = "Choose an output directory"
        dialog.showsResizeIndicator = true
        dialog.showsHiddenFiles = false
        dialog.canChooseFiles = false
        dialog.canChooseDirectories = true
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url
            
            if (result != nil) {
                let path: String = result!.path
                // path contains the directory path

                print("output directory: \(path)")
                
                // update state text label
                self.outputDirectoryTextLabel = path
                
                // update state boolean value
                self.outputDirectorySelected = true
            }
        } else {
            
            print("cancelled")
            //canceled
            return
        }
        
    }

}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
