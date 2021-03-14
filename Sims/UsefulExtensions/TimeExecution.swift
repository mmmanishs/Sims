//
//  TimeExecution.swift
//  etools
//
//  Created by Singh, Manish on 1/13/20.
//  Copyright © 2020 Singh, Manish. All rights reserved.
//

import Foundation

func timeExecution(description: String, code: () -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    code()
    let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime
    print("\(description) (time taken): \(elapsedTime) seconds")
}
