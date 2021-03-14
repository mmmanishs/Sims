//
//  PreviewImage.swift
//  Sims
//
//  Created by Singh, Manish on 4/25/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct PreViewImage: View {
    @EnvironmentObject var imageCombinatorController: ImageCombinatorController
    var body: some View {
        self.imageCombinatorController.previewImage
        .resizable()
        .scaledToFit()
        .contentShape(Rectangle())
        .border(Color.white, width: 1.0)
    }
}
