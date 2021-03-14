//
//  VideoRecordController.swift
//  Sims
//
//  Created by Singh, Manish on 4/3/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import Foundation

class VideoRecordController {
//    func startRecording(uuid: String, processHandle: @escaping (Process) -> ()) {
//        DispatchQueue.global().async {
//            FileSystemController.Video.checkExistanceAndCreateSaveFolderForToday()
//            let startRecordingCommand = "xcrun simctl io \(uuid) recordVideo \(FileSystemController.Video.videoPath)"
//            var shouldBreak = false
//            shouldBreak = true
//
//            let dispatchGroup = DispatchGroup()
//            dispatchGroup.enter()
//            let pipe = Pipe()
//            let task = Process()
//            processHandle(task)
//            task.launchPath = "/bin/sh"
//            task.arguments = ["-c", String(format:"%@", startRecordingCommand)]
//            task.standardOutput = pipe
//            task.terminationHandler = { process in
//                print(process.processIdentifier)
//                dispatchGroup.leave()
//            }
//            task.waitUntilExit()
//            let file = pipe.fileHandleForReading
//            task.launch()
//            dispatchGroup.wait()
//            print("exiting out of the func")
//        }
//        
//    }
    
    func stopRecording() {
        DispatchQueue.global().async {
            _ = "pkill -f simctl".runAsCommand()
        }
    }
}
