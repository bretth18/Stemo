//
//  ShellRunner.swift
//  Stemo
//
//  Created by Brett Henderson on 10/13/20.
//  Copyright © 2020 Brett Henderson. All rights reserved.
//

import Foundation


enum /* namespace */ Shell {
    static func run(command: String, arguments: [String] = []) throws -> (stdout: String?, stderr: String?) {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: command)
        process.arguments = arguments

        let pipes = (stdout: Pipe(), stderr: Pipe())

        process.standardOutput = pipes.stdout
        process.standardError = pipes.stderr
        
        try process.run()

        /* nested */
        func siphon(_ pipe: Pipe) -> String? {
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            guard data.count > 0 else { return nil }
            return String(decoding: data, as: UTF8.self)
        }

        return (siphon(pipes.stdout), siphon(pipes.stderr))
    }
}

enum Bash {
    static func which(command: String) throws -> String? {
        // the command: (/bin/bash -l -c "which ls") expands "ls" into "/bin/ls"
        let out = try Shell.run(command: "/bin/bash" , arguments: ["-l", "-c", "which \(command)"])

        guard let stdout = out.stdout else { return nil }
        return stdout.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
}

//do {
//    guard let ls = try Bash.which(command: "ls") else { fatalError("cannot locate command executable") }
//
//    let out = try Shell.run(command: ls, arguments: ["-la"])
//    if let stdout = out.stdout { print(stdout) }
//}
//catch {
//    fatalError(error.localizedDescription) // vs. exit(911)
//}
