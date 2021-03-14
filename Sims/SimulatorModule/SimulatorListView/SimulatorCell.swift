//
//  SimulatorView.swift
//  Sims
//
//  Created by Manish Singh on 3/19/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct SimulatorCell: View {
    @Binding var selectedDevice: String?
    @EnvironmentObject var simulatorController: SimulatorsController
    var device: Simulator.Device
    @State var cellColor: Color = .white
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if device.state == .booted {
                    Text("🟢")
                        .font(.system(size: 6))
                } else {
                    Text("🔘")
                        .font(.system(size: 5))
                }
                
                Text(device.name)
                    .truncationMode(.tail)
                    .lineLimit(1)
                Spacer()
                
                Text(device.runtimeFormatted)
                    .fontWeight(.semibold)
                    .truncationMode(.head)
                    .lineLimit(1)
                .padding(.trailing, 20)
            }
        }
//        .padding(.leading, 20)
//        .padding(.trailing, 20)
        .contentShape(Rectangle())
        .background((selectedDevice == device.uniqueIdentifier ? Color.lightGray : Color.white))
            //        .border((selectedDevice == device.uniqueIdentifier ? Color.blue : Color.clear), width: (selectedDevice == device.uniqueIdentifier ? 3.0 : 1.0))
            .onTapGesture(count: 2) {
                self.simulatorController.bootSimulator(for: self.device.uniqueIdentifier)
            }
            .onTapGesture(count: 1) {
                self.selectedDevice = self.device.uniqueIdentifier
        }
    }
}


extension Color {
    static var lightGray: Color {
        return Color(red: 211/255, green: 211/255, blue: 211/255)
    }
}
