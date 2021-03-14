//
//  SimulatorMonitoringSystem.swift
//  Sims
//
//  Created by Singh, Manish on 3/31/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import Foundation

class SimulatorMonitoringSystem {
    private var peggedOutput: String = ""
    private var currentOutput: String = ""
    private var timer: Timer?
    private var refreshEverySecond: Double
    private var switchRefreshOff = false
    private var lastRefreshNotifiationTime = Date()

    private var isNotExceedingRefreshRate: Bool {
        return Date().timeIntervalSince(lastRefreshNotifiationTime) > 5
    }

    init(refreshEvery seconds: Double = 2.0) {
        self.refreshEverySecond = seconds
    }

    func startMonitoringOnGlobalQueue(changeHandler: @escaping () -> ()) {
        guard switchRefreshOff == false else {
            return
        }
        
        self.timer?.invalidate()
        self.timer = nil
        self.timer = Timer.scheduledTimer(withTimeInterval: self.refreshEverySecond, repeats: true) { timer in
            DispatchQueue.global().async {
                self.currentOutput = "cd && xcrun simctl list --json".runAsCommand()
            }
            if !SimulatorMonitoringSystem.areEqual(self.currentOutput, self.peggedOutput) && self.isNotExceedingRefreshRate {
                self.peggedOutput = self.currentOutput
                changeHandler()
                self.lastRefreshNotifiationTime = Date()
            }
        }
        DispatchQueue.global().async {
            self.peggedOutput = "cd && xcrun simctl list --json".runAsCommand()
        }
    }

    static func areEqual(_ str1: String, _ str2: String) -> Bool {
        return str2.hashValue == str1.hashValue
//        return str1 == str2
    }

}

func measure(execute block:() -> ()) {
    let start = CFAbsoluteTimeGetCurrent()
    block()
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Took \(diff) seconds")
}
