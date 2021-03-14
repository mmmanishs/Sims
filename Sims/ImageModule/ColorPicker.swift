//
//  ColorPicker.swift
//  Sims
//
//  Created by Singh, Manish on 4/27/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct ColorPicker: View {
    @EnvironmentObject var imageCombinatorController: ImageCombinatorController
    @State private var selected = 0

    let colors = ColorPicker.PickColor.all
    var body: some View {
        VStack {
            Picker(selection: self.$imageCombinatorController.selected, label: Text("Background")) {
                ForEach(0 ..< self.colors.count, id: \.self) { i in
                    HStack {
                        Text(self.colors[i].name)
                        Spacer()
                        Rectangle().foregroundColor(Color.init(NSColor.from(hex: self.colors[i].hex)))
                            .frame(width: 20, height: 10)
                    }
                }
            }
        }
        .onAppear {

        }
    }
}

extension ColorPicker {
    struct PickColor {
        let name: String
        let hex: String
        static var all: [ColorPicker.PickColor] {
            return [
                PickColor(name: "White", hex: "FFFFFF"),
                PickColor(name: "Silver", hex: "C0C0C0"),
                PickColor(name: "Gray", hex: "808080"),
                PickColor(name: "Black", hex: "000000"),
                PickColor(name: "Red", hex: "FF0000"),
                PickColor(name: "Maroon", hex: "800000"),
                PickColor(name: "Yellow", hex: "FFFF00"),
                PickColor(name: "Olive", hex: "808000"),
                PickColor(name: "Lime", hex: "00FF00"),
                PickColor(name: "Green", hex: "008000"),
                PickColor(name: "Aqua", hex: "00FFFF"),
                PickColor(name: "Teal", hex: "008080"),
                PickColor(name: "Blue", hex: "0000FF"),
                PickColor(name: "Navy", hex: "000080"),
                PickColor(name: "Fuchsia", hex: "FF00FF"),
                PickColor(name: "Purple", hex: "800080")
            ]
        }

        static var `default`: PickColor {
            return PickColor(name: "White", hex: "FFFFFF")
        }
    }
}

extension String  {
    func conformsTo(pattern: String) -> Bool {
        let pattern = NSPredicate(format:"SELF MATCHES %@", pattern)
        return pattern.evaluate(with: self)
    }
}

extension NSColor {
    static func from(hex:String) -> NSColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return NSColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return NSColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
