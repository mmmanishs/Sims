//
//  SimulatorListView.swift
//  Sims
//
//  Created by Singh, Manish on 4/2/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct SimulatorListView: View {
    @EnvironmentObject var simulatorController: SimulatorsController
    @Binding var selectedSimulatorUUID: String?
    @State var searchText: String = ""
    var body: some View {
        VStack {
            List {
                Section(header: SearchBar(text: $searchText, placeHolder: "Simulators"), content: {
                    ForEach(simulatorController.devices.filter { sim in
                        if self.searchText == "" { return true }
                        return sim.searchDescription.contains(searchText.lowercased())
                    }, id: \.self) { device in
                        SimulatorCell(selectedDevice: self.$selectedSimulatorUUID, device: device)
                    }
                .fixedSize(horizontal: false, vertical: true)
                    .frame(height: .leastNormalMagnitude)
                })
            }
            .frame(width: 250)
        }
    }
}
