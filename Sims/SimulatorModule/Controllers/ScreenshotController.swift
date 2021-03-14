//
//  ScreenshotController.swift
//  Sims
//
//  Created by Singh, Manish on 4/2/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import Foundation

class ScreenshotController {
    func takeScreenShot(name: String, osVersion: String, uuid: String) {
        DispatchQueue.global().async {
            FileSystemController.Images.todayDirectory.createFolder()
            let screenShotCommand = "xcrun simctl io \(uuid) screenshot --type=png --mask=black \(FileSystemController.Images.suggestedNewFilePath(name, osVersion))"
            _ = screenShotCommand.runAsCommand()
        }
    }
}
