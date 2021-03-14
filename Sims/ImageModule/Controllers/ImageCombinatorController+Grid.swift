//
//  ImageCombinatorController+Grid.swift
//  Sims
//
//  Created by Singh, Manish on 4/10/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import Foundation

extension ImageCombinatorController {

    struct Grid {
            static var initial: Grid {
                return Grid(inputImageUrls: [[nil]])
        //        return Grid(inputImageUrls: [["file:///Users/ldq847/Documents/Sims/Screenshots/4-24-2020/17h.20m.18s.png".url,
        //                                      "file:///Users/ldq847/Documents/Sims/Screenshots/4-24-2020/17h.20m.22s.png".url],
        //                                     ["file:///Users/ldq847/Documents/Sims/Screenshots/4-24-2020/17h.20m.24s.png".url,
        //                                      "file:///Users/ldq847/Documents/Sims/Screenshots/4-24-2020/18h.44m.10s.png".url]])
            }
        var inputImageUrls: [[URL?]]
        var columnCount: Int{
            return inputImageUrls.first!.count
        }
        var rowCount: Int{
            return inputImageUrls.count
        }

        mutating func addRow() {
            let newRow: [URL?] = Array(repeating: nil, count: columnCount)
            inputImageUrls.append(newRow)
        }

        mutating func deleteRow() {
            inputImageUrls.remove(at: rowCount - 1)
        }

        mutating func addColumn() {
            for (index, _) in inputImageUrls.enumerated() {
                inputImageUrls[index].append(nil)
            }
        }

        mutating func deleteColumn() {
            for (index, _) in inputImageUrls.enumerated() {
                inputImageUrls[index].remove(at: columnCount - 1)
            }
        }
    }
}
