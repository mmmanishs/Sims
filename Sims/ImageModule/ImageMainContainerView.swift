//
//  ImageMainContainerView.swift
//  Sims
//
//  Created by Singh, Manish on 4/2/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct ImageMainContainerView: View {
    @State var row = 1
    @State var column = 1
    @Binding var showImageMainContainer: Bool
    @EnvironmentObject var imageCombinatorController: ImageCombinatorController

    var body: some View {
        HStack {
            Spacer()
            ImagesGridView()
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            self.showImageMainContainer = false
                        }, label: {
                            Text("╳")
                                .bold()
                        })
                            .padding(.bottom, 50)
                        Button(action: {
                            self.imageCombinatorController.combineImages(outImagePath: FileSystemController.Images.suggestedNewFilePath)
                        }, label: {Text("Combine Images")})
                        Button(action: {
                            FileSystemController.Images.baseDirectory.openOrCreateIfNotPresentAndOpen()
                        }, label: { Text("Screenshots 📂") })
                        Button(action: {
                            FileSystemController.Images.todayDirectory.openOrCreateIfNotPresentAndOpen()
                        }, label: { Text("Today's 📂") })
                            .padding(.bottom, 20)
                        ColorPicker()
                            .frame(width: 180)
                            .padding()
                    }
                }
                GridSizeControlsView()
                    .padding(.trailing, 20)
                .padding(.bottom, 50)

                HStack {
                    Spacer()
                    PreViewImage()
                        .frame(width: 200, height: 200)

                }
                Spacer()
            }
        }
    }
}
