//
//  SearchBar.swift
//  Sims
//
//  Created by Singh, Manish on 6/30/20.
//  Copyright © 2020 Manish Singh. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false

    let placeHolder: String
    var body: some View {
        HStack {

            TextField(placeHolder, text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.clear))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), placeHolder: "")
    }
}
