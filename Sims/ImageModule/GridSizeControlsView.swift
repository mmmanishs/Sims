//
//  GridSizeControlsView.swift
//  Sims
//
//  Created by Singh, Manish on 4/9/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct GridSizeControlsView: View {
    @EnvironmentObject var icc: ImageCombinatorController
    let max_row_count = 4
    let max_column_count = 4
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Stepper(onIncrement: {
                    guard self.icc.grid.rowCount < self.max_row_count else { return }
                    self.icc.grid.addRow()
                }, onDecrement: {
                    guard self.icc.grid.rowCount > 1 else { return }
                    self.icc.grid.deleteRow()
                    
                }, label: {Text("Row")})
                Text("\(icc.grid.rowCount)")
            }
            HStack {
                Spacer()
                Stepper(onIncrement: {
                    guard self.icc.grid.columnCount < self.max_column_count else { return }
                    self.icc.grid.addColumn()
                }, onDecrement: {
                    guard self.icc.grid.columnCount > 1 else { return }
                    self.icc.grid.deleteColumn()
                }, label: {Text("Column")})
                Text("\(icc.grid.columnCount)")
            }
        }
    }
}
