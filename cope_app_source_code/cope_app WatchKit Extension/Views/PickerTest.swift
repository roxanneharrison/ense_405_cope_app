//
//  PickerTest.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-11-19.
//

import SwiftUI

struct PickerTest: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"

    var body: some View {
        VStack {
            Picker("Please choose a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            Text("You selected: \(selectedColor)")
        }
    }
}

struct PickerTest_Previews: PreviewProvider {
    static var previews: some View {
        PickerTest()
    }
}
