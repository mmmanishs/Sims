//
//  String+FileOperations.swift
//  etools
//
//  Created by Singh, Manish on 10/31/19.
//  Copyright © 2019 Singh, Manish. All rights reserved.
//

import AppKit

extension String {
    var filesAtThisPathRecursively: [String] {
        let fileManager = FileManager.default
        let enumerator:FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: self)!
        var filePaths = [String]()
        while let element = enumerator.nextObject() as? String {
            filePaths.append(self + element)
        }
        return filePaths
    }

    var fileName: String {
        return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }

    var fileExtension: String {
        return URL(fileURLWithPath: self).pathExtension
    }

    func write(data: Data) {
        let filePathUrl = URL(string: "file://" + self)!
        try? data.write(to: filePathUrl)
    }

    func compareToFile(at path: String) -> Bool {
        guard fileSize == path.fileSize else {
            return false
        }
        let fileManager = FileManager.default
        let contentsOfSelf = fileManager.contents(atPath: self)
        let contentsBeingCompared = fileManager.contents(atPath: path)
        if contentsOfSelf == nil || contentsBeingCompared == nil {
            return false
        }
        let value = contentsOfSelf == contentsBeingCompared
        return value
    }

    var url: URL {
        get {
            return URL(string: self)!
        }
    }

    var filePathURL: URL {
        return URL(fileURLWithPath: self)
    }

    var filenameExtension: String? {
        return components(separatedBy: ".").last
    }

    var fileSize: UInt64 {
        do {
            let attr = try FileManager.default.attributesOfItem(atPath: self)
            return attr[FileAttributeKey.size] as! UInt64
        } catch {
            print("Error: \(error)")
        }
        return 0
    }

    func writeToFile(path: String) {
        do {
            try write(to: URL(string: path)!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Unable to write *\(self)* to *\(path)*")
        }
    }
}


extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}


extension Array {
    subscript (safe index: UInt) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }
}

extension Collection where Iterator.Element == String {
    func displayString() -> String {
        var output = String()
        var i = 1
        self.forEach { str in
            output += "\(i). \(str)"
            output += "\n"
            i += 1
        }
        return output
    }
}

extension Dictionary where Key: ExpressibleByStringLiteral, Value: ExpressibleByStringLiteral {
    func displayString() -> String {
        var output = String()
        var i = 1
        self.forEach { str in
            output += "\(str.key): \(str.value)"
            output += "\n"
            i += 1
        }
        return output
    }
}
