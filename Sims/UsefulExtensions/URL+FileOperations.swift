//
//  URL+FileOperations.swift
//  Sims
//
//  Created by Singh, Manish on 4/21/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import Foundation

extension URL {
    func openOrCreateIfNotPresentAndOpen() {
        DispatchQueue.global().async {
            if !self.folderExists {
                self.createFolder()
            }
            self.openFolder()
        }
    }

    func openFolder() {
        DispatchQueue.global().async {
            _ = "open \(self.path)".runAsCommand()
        }
    }

    var folderExists: Bool {
        guard let rv = try? resourceValues(forKeys: [.isDirectoryKey]),
            let isDirectory = rv.isDirectory else {
                return false
        }
        return isDirectory
    }

    func createFolder() {
        DispatchQueue.global().async {
            _ = "mkdir \(self.path) && chmod 777 \(self.path)".runAsCommand()
        }
    }
}

extension String {
    func openFolder() {
        _ = "open \(self)".runAsCommand()
    }
}
