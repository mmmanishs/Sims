//
//  ImagesGridView.swift
//  Sims
//
//  Created by Singh, Manish on 4/8/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct ImagesGridView: View {
    @EnvironmentObject var imageCombinatorController: ImageCombinatorController
    var body: some View {
        VStack {
            ForEach(0..<self.imageCombinatorController.grid.rowCount, id: \.self) { i in
                RowView(rowIndex: i, column: self.imageCombinatorController.grid.columnCount)
            }
        }
    }
}


extension ImagesGridView {
    struct RowView: View {
        var rowIndex: Int
        var column: Int
        var rectSide: CGFloat = 100
        var body: some View {
            HStack {
                ForEach(0..<column, id: \.self) { i in
                    Cell(rowIndex: self.rowIndex, columnIndex: i)
                        .foregroundColor(Color.primary)
                        .frame(width: self.rectSide, height: self.rectSide)
                        .padding(.bottom, 40)
                }
            }
        }
    }
    
    struct Cell: View, DropDelegate {
        var rowIndex: Int
        var columnIndex: Int
        @EnvironmentObject var imageCombinatorController: ImageCombinatorController
        @State var isPlaceHolderImage = false
        var imageName: String {
            if rowIndex < imageCombinatorController.grid.rowCount,
                columnIndex < imageCombinatorController.grid.columnCount,
                let url = imageCombinatorController.grid.inputImageUrls[rowIndex][columnIndex] {
                return url.lastPathComponent
            } else {
                return "-"
            }
        }
        var imageToShow: Image {
            if rowIndex < imageCombinatorController.grid.rowCount,
                columnIndex < imageCombinatorController.grid.columnCount,
                let url = imageCombinatorController.grid.inputImageUrls[rowIndex][columnIndex] {
                DispatchQueue.main.async {
                    self.isPlaceHolderImage = false
                }
                return Image(nsImage: NSImage(byReferencing: url))
            } else {
                DispatchQueue.main.async {
                    self.isPlaceHolderImage = true
                }
                return Image("image-placeholder")
            }
        }
        
        var body: some View {
            Group {
                if isPlaceHolderImage {
                    GeometryReader { geometry in
                        ZStack {
                            VStack {
                                self.imageToShow
                                    .resizable()
                                    .scaledToFit()
                                    .contentShape(Rectangle())
                                    .border(Color.white, width: 1.0)
                                    .onDrop(of: [(kUTTypeFileURL as String)], delegate: self)
                                Text(self.imageName)
                            }

                        }
                    }
                } else {
                    GeometryReader { geometry in
                        ZStack {
                            VStack {
                                self.imageToShow
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100.0)
                                    .contentShape(Rectangle())
                                    .border(Color.white, width: 1.0)
                                    .onDrop(of: [(kUTTypeFileURL as String)], delegate: self)
                                Text(self.imageName).font(.system(size: 11))
                            }

                            VStack {
                                HStack {
                                    Spacer()
                                    Text("╳")
                                        .font(.system(.headline, design: .default))
                                        .contentShape(Rectangle())
                                        .border(Color.black)
                                        .onTapGesture {
                                            self.imageCombinatorController.grid.inputImageUrls[self.rowIndex][self.columnIndex] = nil
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                }
                Spacer()
            }
        }
        
        func performDrop(info: DropInfo) -> Bool {
            let item = info.itemProviders(for: [(kUTTypeFileURL as String)]).first
            item?.loadItem(forTypeIdentifier: (kUTTypeFileURL as String), options: nil) { item, error in
                guard let data = item as? Data, let url = URL(dataRepresentation: data, relativeTo: nil) else {
                    return
                }
                print(url)
                DispatchQueue.main.async {
                    self.imageCombinatorController.grid.inputImageUrls[self.rowIndex][self.columnIndex] = url
                }
            }
            return true
        }
    }
}
