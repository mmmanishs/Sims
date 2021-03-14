//
//  SimulatorRightDetailsContainerView.swift
//  Sims
//
//  Created by Manish Singh on 3/21/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct SimulatorRightDetailsContainerView: View {
    @EnvironmentObject var simulatorController: SimulatorsController
    @Binding var selectedSimulatorUUID: String?

    var device: Simulator.Device? {
        guard let selectedSimulatorUUID = selectedSimulatorUUID else {
            return nil
        }
        return simulatorController.getDevice(for: selectedSimulatorUUID)
    }

    @State var deeplink: String = ""
    var body: some View {
        Group {
            if device == nil {
                Text("No device selected. Please select a device on the left pane")
            } else {
                HStack {
                    VStack {
                        SimulatorDetailsTitleInfoView(selectedSimulatorUUID: $selectedSimulatorUUID)
                            .padding()
                        Divider()
                        ScreenshotsAndVideoView(selectedSimulatorUUID: $selectedSimulatorUUID)
                        OpenSafariURLView(selectedSimulatorUUID: $selectedSimulatorUUID)
                        PushNotificationView(selectedSimulatorUUID: $selectedSimulatorUUID)
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

