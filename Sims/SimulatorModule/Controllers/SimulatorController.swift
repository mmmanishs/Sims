//
//  SimulatorController1.swift
//  Sims
//
//  Created by Singh, Manish on 4/22/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI
import Combine

class SimulatorsController: ObservableObject {
    let simulatorMonitoringSystem = SimulatorMonitoringSystem(refreshEvery: 2.0)
    let screenshotController = ScreenshotController()
    let videoRecordController = VideoRecordController()
    @Published var devices: [Simulator.Device] = []
    @Published var shouldShowErrorMessage = false
    var errorMessage: String = ""
    var bootedDevices: [Simulator.Device] {
        devices.filter { $0.state == .booted }
    }
    var shutdownDevices: [Simulator.Device] {
        devices.filter { $0.state != .booted }
    }
    
    func startOverView() {
        devices = Simulator.getUpdatedDevices()
        simulatorMonitoringSystem.startMonitoringOnGlobalQueue {
            DispatchQueue.main.async {
                print("**********Asking for refresh**********")
                self.devices = Simulator.getUpdatedDevices()
            }
        }
    }
    
    func getDevice(for uuid: String) -> Simulator.Device? {
        return getDevice(deviceList: devices, for: uuid)
    }
    
    private func getDevice(deviceList: [Simulator.Device], for uuid: String) -> Simulator.Device? {
        return devices.filter { device in
            device.udid == uuid
        }.first
    }
}
extension SimulatorsController {
    func bootSimulator(for uuid: String) {
        DispatchQueue.global().async {
            _ = "xcrun simctl boot \(uuid)".runAsCommand()
            let device = self.getDevice(deviceList: Simulator.getUpdatedDevices(), for: uuid)
            if device!.state != .booted {
                _ = "open -a Simulator --args -CurrentDeviceUDID \(uuid)".runAsCommand()
            }
        }
    }
    
    func shutDownSimulator(for uuid: String) {
        DispatchQueue.global().async {
            _ = "xcrun simctl shutdown \(uuid)".runAsCommand()
        }
    }
    
    func openURLInSafari(for uuid: String, deeplink: String) {
        DispatchQueue.global().async {
            _ = "xcrun simctl openurl \(uuid) \(deeplink)".runAsCommand()
//            _ = "brew install imagemagik".runAsCommand()
        }
    }
    
    func openDeepLinks(for uuid: String, deeplink: String) {
        DispatchQueue.global().async {
            _ = "xcrun simctl openurl \(uuid) https://www.google.com && xcrun simctl openurl \(uuid) \(deeplink)".runAsCommand()
        }
    }
}
extension SimulatorsController {
    func takeScreenshot() {
        _ = "xcrun simctl io booted screenshot /Users/ldq847/Desktop/myScreenshot.png".runAsCommand()
    }
}
