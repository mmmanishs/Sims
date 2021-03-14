//
//  PushNotificationView.swift
//  Sims
//
//  Created by Singh, Manish on 4/22/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct PushNotificationView: View {
    @EnvironmentObject var simulatorController: SimulatorsController
    @Binding var selectedSimulatorUUID: String?

    var device: Simulator.Device? {
        guard let selectedSimulatorUUID = selectedSimulatorUUID else {
            return nil
        }
        return simulatorController.getDevice(for: selectedSimulatorUUID)
    }

    @State var applicationBundleIdentifier: String = "com.capitalone.fivexwk"
    @State var jsonPayload: String = "{some: 1}"
    var body: some View {
        VStack {
            Text("Push Notification View")
            .padding()
            TextField("Application Bundle Identifier", text: $applicationBundleIdentifier)
            TextField("Payload", text: $jsonPayload)
            Button(action: {
                FileSystemController.TempDirectory.todayDirectory.createFolder()
                let payloadFilePath = "\(FileSystemController.TempDirectory.suggestedNewFilePath).json"
                self.jsonPayload.writeToFile(path: payloadFilePath)
                let command = "xcrun simctl push \(self.selectedSimulatorUUID!) \(self.applicationBundleIdentifier) \(payloadFilePath)"
                command.runAsCommand()
            }, label: {Text("Send Notification")})
        }
    }
}
