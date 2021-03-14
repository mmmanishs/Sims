//
//  SimulatorDetailsTitleInfoView.swift
//  Sims
//
//  Created by Singh, Manish on 3/31/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct SimulatorDetailsTitleInfoView: View {
    @EnvironmentObject var simulatorController: SimulatorsController
    @Binding var selectedSimulatorUUID: String?
    
    var device: Simulator.Device {
        return simulatorController.getDevice(for: selectedSimulatorUUID!)!
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(device.name) (\(device.runtimeFormatted))")
                    .bold()
                    .lineLimit(nil)
                Text(device.uniqueIdentifier)
                    .bold()
                    .font(.system(size: 10))
                    .lineLimit(nil)
                HStack {
                    SimulatorStartStopView(selectedSimulatorUUID: $selectedSimulatorUUID)
                        .frame(width: 15, height: 15)
                }
                .frame(alignment: .center)
            }
        }
        .frame(width: 350)
    }
}
