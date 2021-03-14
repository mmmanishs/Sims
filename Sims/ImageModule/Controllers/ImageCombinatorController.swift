//
//  ImageCombinatorController.swift
//  Sims
//
//  Created by Singh, Manish on 4/8/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

let montage_executable = Bundle.main.path(forResource: "montage", ofType: nil)!
let convert_executable = Bundle.main.path(forResource: "convert", ofType: nil)!

class ImageCombinatorController: ObservableObject {
    @Published var grid: Grid {
        didSet {
            startPreview()
        }
    }
    @Published var selected = 0 {
        didSet {
            let colors = ColorPicker.PickColor.all
            imageBackgroundColor = colors[selected]
        }
    }

    @Published var previewImage: Image
    var imageBackgroundColor: ColorPicker.PickColor = .default {
        didSet {
            startPreview()
        }
    }

    init() {
        self.grid = Grid.initial
        previewImage = Image(nsImage: (NSImage(named: "blank-image")!))
        startPreview()
    }

    func startPreview() {
        DispatchQueue.global().async {
            _ = "rm \(FileSystemController.Images.suggestedTempFilePath)".runAsCommand()
            self.combineImages(outImagePath: FileSystemController.Images.suggestedTempFilePath) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.previewImage = Image(nsImage: NSImage(contentsOfFile: FileSystemController.Images.suggestedTempFilePath) ?? NSImage(named: "iphone")!)
                }
            }
        }
    }

    func updatePreviewImage() {
        _ = "rm \(FileSystemController.Images.suggestedTempFilePath)".runAsCommand()
        combineImages(outImagePath: FileSystemController.Images.suggestedTempFilePath) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.previewImage = Image(nsImage: NSImage(contentsOfFile: FileSystemController.Images.suggestedTempFilePath) ?? NSImage(named: "iPhone")!)
            }
        }
    }

    func combineImages(outImagePath: String, completion: (() -> ())? = nil) {
        FileSystemController.Images.todayDirectory.createFolder()
        let geometry = #"-geometry 768x1024\>-0+0"#
        let command = "\(montage_executable) \(imagesLabels) \(imagesPaths) \(title) \(geometry) \(tiling) \(shadow) \(backGroundColor)  \(outImagePath)"
        _ = command.runAsCommand() { _ in
            completion?()
        }
    }
}


extension ImageCombinatorController {
    var imagesPaths: String {
        let arrayUrls = grid.inputImageUrls
        var imagesCommand = ""
        for urls in arrayUrls {
            for url in urls {
                if let url = url {
                    imagesCommand += "'\(url.path)'"
                } else {
                    imagesCommand += "null:"
                }
                imagesCommand += " "
            }
        }
        var arrayCommand = Array(imagesCommand)
        arrayCommand.removeLast()
        return String(arrayCommand)
    }

    var tiling: String {
        return "-tile \(grid.inputImageUrls.first!.count)x\(grid.inputImageUrls.count)"
    }

    var backGroundColor: String {
        //        return "-background darkgreen"
        //        return "-background \'#f1eeef\'"
        //        let a = #"'rgb(200,155,255)'"#
        let a = #"'#\#(imageBackgroundColor.hex)'"#
        //        let a = #"'#34ebc6'"#
        return "-background \(a)"
        //        return "-fill \'#f1eeef\'"
    }
    
    var shadow: String {
        return ""
        //        return "-shadow"
    }

    var title: String {
        return #"-title 'Some Image title'"#
        //        return "-shadow"
    }

    var imagesLabels: String {
        return #"-pointsize 35 -label '%f'"#
    }
}
