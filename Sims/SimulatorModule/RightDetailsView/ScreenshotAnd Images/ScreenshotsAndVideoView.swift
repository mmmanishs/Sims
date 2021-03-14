//
//  ScreenshotsAndVideoView.swift
//  Sims
//
//  Created by Singh, Manish on 4/2/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI
var pinnedProcess: Process?

struct ScreenshotsAndVideoView: View {
    @EnvironmentObject var simulatorController: SimulatorsController
    @State var deeplink: String = ""
    var device: Simulator.Device? {
        guard let selectedSimulatorUUID = selectedSimulatorUUID else {
            return nil
        }
        return simulatorController.getDevice(for: selectedSimulatorUUID)
    }
    @State var isRecording = false
    @Binding var selectedSimulatorUUID: String?

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.simulatorController.screenshotController.takeScreenShot(name: self.device!.name, osVersion: self.device!.runtimeFormatted, uuid: self.selectedSimulatorUUID!)
                }, label: { Text("Take screenshot").bold()
                })
                Button(action: {
                    FileSystemController.Images.baseDirectory.openFolder()
                }, label: { Text("📂") })
            }
//            HStack {
//                Button(action: {
//                    if !self.isRecording {
//                        DispatchQueue.global().async {
//                            self.simulatorController.videoRecordController.startRecording(uuid: self.selectedSimulatorUUID!) { process in
//                                pinnedProcess = process
//                            }
//                        }
//                    } else {
////                        self.simulatorController.videoRecordController.stopRecording()
//                        pinnedProcess?.terminate()
//                    }
//                    self.isRecording.toggle()
//                }, label: { Text(self.isRecording ? "Stop Recording.." : "Start Recording..").bold()
//                })
//                Button(action: {
//                    FileSystemController.Video.baseDirectory.openFolder()
//                }, label: { Text("📂") })
//            }
        }
        .padding()
    }
}
