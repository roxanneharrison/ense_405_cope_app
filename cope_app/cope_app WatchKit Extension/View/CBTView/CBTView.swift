//
//  CBTView2.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-23.
//

import SwiftUI

struct CBTView: View {
    var body: some View {
        
            GeometryReader{
                geometry in
            VStack {
                    Text("<insert cue here>")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Next")
                }
                .background(Color.blue)
                .cornerRadius(20)
            }
    }
    }
}

struct CBTView2_Previews: PreviewProvider {
    static var previews: some View {
        CBTView()
    }
}
