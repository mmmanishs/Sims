//
//  String+ConsoleOutput.swift
//  etools
//
//  Created by Singh, Manish on 10/31/19.
//  Copyright © 2019 Singh, Manish. All rights reserved.
//

import Foundation

enum ANSIColor: String {

    typealias This = ANSIColor

    case black = "\u{001B}[0;30m"
    case red = "\u{001B}[0;31m"
    case green = "\u{001B}[0;32m"
    case yellow = "\u{001B}[0;33m"
    case blue = "\u{001B}[0;34m"
    case magenta = "\u{001B}[0;35m"
    case cyan = "\u{001B}[0;36m"
    case white = "\u{001B}[0;37m"
    case `default` = "\u{001B}[0;0m"

    static var values: [This] {
        return [.black, .red, .green, .yellow, .blue, .magenta, .cyan, .white, .default]
    }

    static var names: [This: String] {
        return [
            ANSIColor.black: "black",
            ANSIColor.red: "red",
            ANSIColor.green: "green",
            ANSIColor.yellow: "yellow",
            ANSIColor.blue: "blue",
            ANSIColor.magenta: "magenta",
            ANSIColor.cyan: "cyan",
            ANSIColor.white: "white",
            ANSIColor.default: "default"
        ]
    }

    var name: String {
        return This.names[self] ?? "unknown"
    }

    static func + (lhs: This, rhs: String) -> String {
        return lhs.rawValue + rhs
    }

    static func + (lhs: String, rhs: This) -> String {
        return lhs + rhs.rawValue
    }

}
extension String {

    func colored(_ color: ANSIColor) -> String {
        return color + self + ANSIColor.default
    }

    var black: String {
        return colored(.black)
    }

    var red: String {
        return colored(.red)
    }

    var green: String {
        return colored(.green)
    }

    var yellow: String {
        return colored(.yellow)
    }

    var blue: String {
        return colored(.blue)
    }

    var magenta: String {
        return colored(.magenta)
    }

    var cyan: String {
        return colored(.cyan)
    }

    var white: String {
        return colored(.white)
    }

}
