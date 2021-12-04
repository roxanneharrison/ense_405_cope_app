//
//  CopeView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-23.
//

import SwiftUI

struct CopeView: View {
    // User selected color in app storage
    @AppStorage("user_color") var user_color: String = "blue" // default is blue
    
    var body: some View {
        VStack{
        Spacer()
            // Mantras Button
        NavigationLink(
            destination: MantraView(),
            label: {
                Text("Mantras")
                    .font(.title)
            })
            .foregroundColor(Color.white)
            .buttonStyle(.borderless)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color(user_color))
            .cornerRadius(20)
            // Breathe button
        NavigationLink(
            destination: BreatheView(),
            label: {
                Text("Breathe")
                    .font(.title)
            })
            .foregroundColor(Color.white)
            .buttonStyle(.borderless)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color(user_color))
            .cornerRadius(20)
            // Settings
            NavigationLink(
                destination: SettingsView(),
                label: {
                    HStack{
                        Text("Settings")
                            .font(.caption)
                        Image(systemName: "gearshape")
                   
                    }
                    
                })
                .buttonStyle(.borderless)
                .foregroundColor(Color.white)
                .frame(alignment: .bottom)
        }
    }
}
struct CopeView_Previews: PreviewProvider {
    static var previews: some View {
        CopeView()
    }
}
