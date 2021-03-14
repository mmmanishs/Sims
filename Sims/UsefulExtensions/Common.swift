//
//  Common.swift
//  etools
//
//  Created by Singh, Manish on 1/21/20.
//  Copyright © 2020 Singh, Manish. All rights reserved.
//

import Foundation

enum OutputType {
    case json
    case csv
    init(_ string: String?) {
        switch string {
        case "csv":
            self = OutputType.csv
        case "json":
            self = OutputType.json
        default:
            self = OutputType.json
        }
    }
}
