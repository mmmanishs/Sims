//
//  String+RunTasks.swift
//  etools
//
//  Created by Singh, Manish on 2/13/20.
//  Copyright © 2020 Singh, Manish. All rights reserved.
//

import Foundation
struct TaskResult {
    var output: String?
    var error: String?
}
extension String {
    func runAsCommand(completion: ((Process) -> ())? = nil) -> String {
        let pipe = Pipe()
        let task = Process()
        task.launchPath = "/bin/sh"
        task.arguments = ["-c", String(format:"%@", self)]
        task.standardOutput = pipe
        task.terminationHandler = completion
        task.waitUntilExit()
        let file = pipe.fileHandleForReading
        task.launch()
        if let result = NSString(data: file.readDataToEndOfFile(), encoding: String.Encoding.utf8.rawValue) {
            return result as String
        }
        else {
            return "--- Error running command - Unable to initialize string from file data ---"
        }
    }

    func runAsCommand1(completion: ((Process) -> ())? = nil) -> TaskResult {
        var taskResult = TaskResult()
        let errorPipe = Pipe()
        let pipe = Pipe()
        let task = Process()
        task.launchPath = "/bin/sh"
        task.currentDirectoryPath = "/Users/"
        task.arguments = ["-c", String(format:"%@", self)]
        task.standardOutput = pipe
        task.standardError = errorPipe
        task.terminationHandler = completion
        task.waitUntilExit()
        let file = pipe.fileHandleForReading
        let errorFile = errorPipe.fileHandleForReading


        task.launch()
        if let result = NSString(data: errorFile.readDataToEndOfFile(), encoding: String.Encoding.utf8.rawValue) {
            taskResult.error = result as String
        }
        if let result = NSString(data: file.readDataToEndOfFile(), encoding: String.Encoding.utf8.rawValue) {
            taskResult.output = result as String
        }
        else {
            taskResult.error = "--- Error running command - Unable to initialize string from file data ---"
        }
        return taskResult
    }
}

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    func matches(for regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
