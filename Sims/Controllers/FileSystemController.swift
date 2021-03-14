//
//  FileSystemController.swift
//  Sims
//
//  Created by Singh, Manish on 4/8/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import Foundation

/// Needs refactoring
enum FileSystemController {
//    enum Video {
//        static var baseDirectory: URL {
//            let documentsUrl = FileManager.default.urls(for: .documentDirectory,
//                                                        in: .userDomainMask).first!
//            return documentsUrl.appendingPathComponent("Sims").appendingPathComponent("VideoRecordings")
//        }
//
//        static var todayDirectory: URL {
//            let calanderDate = Calendar.current.dateComponents([.day, .year, .month], from: Date())
//            let dateString = "\(calanderDate.month!)-\(calanderDate.day!)-\(calanderDate.year!)"
//            return baseDirectory.appendingPathComponent(dateString)
//        }
//
//        static var suggestedNewFilePath: String {
//            let calanderDate = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
//            let dateString = "\(calanderDate.hour!)h.\(calanderDate.minute!)m.\(calanderDate.second!)s"
//            var suggestedNewFilePath = "\(todayDirectory.appendingPathComponent(dateString).path).mov"
//            var count = 1
//            while FileManager.default.fileExists(atPath: suggestedNewFilePath, isDirectory: nil) {
//                count += 1
//                suggestedNewFilePath = "\(todayDirectory.appendingPathComponent(dateString).path) (\(count)).mov"
//            }
//            return suggestedNewFilePath
//        }
//
//        static func pathVideo(for fileName: String) -> String {
//            return todayDirectory.appendingPathComponent(fileName).path
//        }
//
//        static var videoPath: String {
//            let calanderDate = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
//            let dateString = "\(calanderDate.hour!)h.\(calanderDate.minute!)m.\(calanderDate.second!)s"
//            var suggestedNewFilePath = "\(todayDirectory.appendingPathComponent(dateString).path).mov"
//            var count = 1
//            while FileManager.default.fileExists(atPath: suggestedNewFilePath, isDirectory: nil) {
//                count += 1
//                suggestedNewFilePath = "\(todayDirectory.appendingPathComponent(dateString).path) (\(count)).mov"
//            }
//            return suggestedNewFilePath
//        }
//    }

    enum TempDirectory {
        static var baseDirectory: URL {
            let documentsUrl = FileManager.default.urls(for: .documentDirectory,
                                                        in: .userDomainMask).first!
            return documentsUrl.appendingPathComponent("Sims").appendingPathComponent("temp-directory")
        }

        static var todayDirectory: URL {
            let calanderDate = Calendar.current.dateComponents([.day, .year, .month], from: Date())
            let dateString = "\(calanderDate.month!)-\(calanderDate.day!)-\(calanderDate.year!)"
            return baseDirectory.appendingPathComponent(dateString)
        }

//        static var suggestedNewFilePath: String {
//            let calanderDate = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
//            let dateString = "\(calanderDate.hour!)h.\(calanderDate.minute!)m.\(calanderDate.second!)s"
//            var suggestedNewFilePath = "\(todayDirectory.appendingPathComponent(dateString).path)"
//            var count = 1
//            while FileManager.default.fileExists(atPath: suggestedNewFilePath, isDirectory: nil) {
//                count += 1
//                suggestedNewFilePath = "\(todayDirectory.appendingPathComponent(dateString).path) (\(count))"
//            }
//            return suggestedNewFilePath
//        }

        static func suggestedNewFilePath(_ name: String, _ osVersion: String) -> String {
            let calanderDate = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
            let dateString = "\(calanderDate.hour!)h.\(calanderDate.minute!)m.\(calanderDate.second!)s"
            var suggestedNewFilePath = "\(todayDirectory.appendingPathComponent("\(name)_\(osVersion)_\(dateString)").path)"
            var count = 1
            while FileManager.default.fileExists(atPath: suggestedNewFilePath, isDirectory: nil) {
                count += 1
                suggestedNewFilePath = "\(todayDirectory.appendingPathComponent(dateString).path) (\(count))"
            }
            return suggestedNewFilePath
        }
    }
    enum Images {
        static var baseDirectory: URL {
            let documentsUrl = FileManager.default.urls(for: .documentDirectory,
                                                        in: .userDomainMask).first!
            return documentsUrl.appendingPathComponent("Sims").appendingPathComponent("Screenshots")
        }

        static var todayDirectory: URL {
            let calanderDate = Calendar.current.dateComponents([.day, .year, .month], from: Date())
            let dateString = "\(calanderDate.month!)-\(calanderDate.day!)-\(calanderDate.year!)"
            return baseDirectory.appendingPathComponent(dateString)
        }

        static var suggestedNewFilePath: String {
            let calanderDate = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
            let dateString = "\(calanderDate.hour!)h.\(calanderDate.minute!)m.\(calanderDate.second!)s"
            var suggestedNewFilePath = "\(todayDirectory.appendingPathComponent(dateString).path).png"
            var count = 1
            while FileManager.default.fileExists(atPath: suggestedNewFilePath, isDirectory: nil) {
                count += 1
                suggestedNewFilePath = "\(todayDirectory.appendingPathComponent(dateString).path) (\(count)).png"
            }
            return suggestedNewFilePath
        }

        static func suggestedNewFilePath(_ name: String, _ osVersion: String) -> String {
            let calanderDate = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
            let dateString = "\(calanderDate.hour!)h.\(calanderDate.minute!)m.\(calanderDate.second!)s"
            var suggestedNewFilePath = "\(todayDirectory.appendingPathComponent("\(name)_\(osVersion)_\(dateString)").path).png"
            var count = 1
            while FileManager.default.fileExists(atPath: suggestedNewFilePath, isDirectory: nil) {
                count += 1
                suggestedNewFilePath = "\(todayDirectory.appendingPathComponent(dateString).path) (\(count)).png"
            }
            return suggestedNewFilePath
        }

        static var suggestedTempFilePath: String {
            let suggestedNewFilePath = "\(todayDirectory.appendingPathComponent("temp-file-preview").path).png"

            return suggestedNewFilePath
        }

    }
}
