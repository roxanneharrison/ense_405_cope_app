//
//  BreatheView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-24.
//

import SwiftUI

struct BreatheView: View {
    var body: some View {
        VStack{
            Text("Inhale")
                .font(.system(size: 30))
            ZStack{
                Circle()
                    .fill(user_color)
                    .frame(width: 20)
                Circle()
                    .stroke(Color.white)
            }

        }

    }
}

struct BreatheView_Previews: PreviewProvider {
    static var previews: some View {
        BreatheView()
    }
}
