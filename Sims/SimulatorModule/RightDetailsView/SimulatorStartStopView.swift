//
//  SimulatorStartStopView.swift
//  Sims
//
//  Created by Singh, Manish on 3/31/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct SimulatorStartStopView: View {
    var errorMessage: String = ""
    @EnvironmentObject var simulatorController: SimulatorsController
    var device: Simulator.Device {
        return simulatorController.getDevice(for: selectedSimulatorUUID!)!
    }
    @Binding var selectedSimulatorUUID: String?

    var body: some View {
        Group {
            if device.state == .shutdown {
            Image("start")
                .resizable()
                .scaledToFit()
//                .padding(.top, 15)
                .animation(.easeInOut)
                .onTapGesture {
                    self.simulatorController.bootSimulator(for: self.device.uniqueIdentifier)
                }
            }
            else if device.state == .booted {
            Image("stop")
                .resizable()
                .scaledToFit()
//                .padding(.top, 15)
                .animation(.easeInOut)
                .onTapGesture {
                    self.simulatorController.shutDownSimulator(for: self.device.uniqueIdentifier)
                }
            }
        }
    }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
    }
}
