//
//  MainContainerView.swift
//  Sims
//
//  Created by Singh, Manish on 3/23/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct MainContainerView: View {
    @EnvironmentObject var simulatorController: SimulatorsController
    @State var showImageMainContainer: Bool = false
    @State var selectedSimulatorUUID: String?
    let imageCombinatorController = ImageCombinatorController()
    
    var body: some View {
        HStack {
            VStack {
                Image("blank-image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.top, 15)
                    .onTapGesture {
                        self.showImageMainContainer = true
                }
                Divider()
                Image("apple-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        self.showImageMainContainer = false
                }
                Spacer()
            }
            .frame(width: 40)
            Group {
                if showImageMainContainer {
                    ImageMainContainerView(showImageMainContainer: $showImageMainContainer)
                        .environmentObject(imageCombinatorController)
                    
                } else {
                    HStack {
                        SimulatorListView(selectedSimulatorUUID: $selectedSimulatorUUID)
                        Divider()
                        SimulatorRightDetailsContainerView(selectedSimulatorUUID: $selectedSimulatorUUID)
                    }
                }
            }
        }
        .onAppear {
            self.simulatorController.startOverView()
            self.selectedSimulatorUUID = self.simulatorController.devices.first?.uniqueIdentifier
        }
    }
}
