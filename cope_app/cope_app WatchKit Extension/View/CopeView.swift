//
//  CopeView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-23.
//

import SwiftUI

// User selected color to be updated in future MVP
var user_color = Color.blue

struct CopeView: View {
    
    var body: some View {
        VStack{
            
        NavigationLink(
            destination: CBTView(),
            label: {
                Text("CBT")
                    .font(.title)
            })
            .foregroundColor(Color.white)
            .buttonStyle(.borderless)
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(user_color)
            .cornerRadius(20)

        NavigationLink(
            destination: BreatheView(),
            label: {
                Text("Breathe")
                    .font(.title)
            })
            .foregroundColor(Color.white)
            .buttonStyle(.borderless)
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(user_color)
            .cornerRadius(20)

        }
    }
}
struct CopeView_Previews: PreviewProvider {
    static var previews: some View {
        CopeView()
    }
}
