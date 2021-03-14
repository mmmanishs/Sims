//
//  SimsTests.swift
//  SimsTests
//
//  Created by Singh, Manish on 4/25/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import XCTest
@testable import Sims
class SimsTests: XCTestCase {

    let jsonString1 = "cd && xcrun simctl list --json".runAsCommand()
    let jsonString2 = "cd && xcrun simctl list --json".runAsCommand() + "sdcsv"
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            [0..<100000000].forEach {_ in 
                SimulatorMonitoringSystem.areEqual(jsonString1, jsonString2)
            }
        }
    }

}
