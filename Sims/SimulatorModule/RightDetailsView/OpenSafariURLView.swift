//
//  OpenSafariURLView.swift
//  Sims
//
//  Created by Manish Singh on 3/21/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct OpenSafariURLView: View {
    @EnvironmentObject var simulatorController: SimulatorsController
    @State var deeplink: String = ""
    var device: Simulator.Device? {
        guard let selectedSimulatorUUID = selectedSimulatorUUID else {
            return nil
        }
        return simulatorController.getDevice(for: selectedSimulatorUUID)
    }
    @Binding var selectedSimulatorUUID: String?


    var body: some View {
        VStack {
            Text("Open URL/Deeplinks")
            TextField("URL", text: $deeplink)
            HStack {
                Button(action: {
                    guard let device = self.device else {return}
                    self.simulatorController.openURLInSafari(for: device.uniqueIdentifier, deeplink: self.deeplink)
                }, label: {Text("Safari")})
                    .padding()
                Button(action: {
                    guard let device = self.device else {return}
                    self.simulatorController.openDeepLinks(for: device.uniqueIdentifier, deeplink: self.deeplink)
                }, label: {Text("Deeplink")})

            }
        }
    }
}
