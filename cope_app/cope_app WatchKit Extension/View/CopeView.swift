//
//  CopeView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-23.
//

import SwiftUI

struct CopeView: View {
    
    var body: some View {
        VStack{
            
        NavigationLink(
            destination: CBTView(),
            label: {
                Text("CBT")
                    .font(.title)
            })
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(Color.blue)
            .cornerRadius(20)
        
        NavigationLink(
            destination: CBTView(),
            label: {
                Text("Breathe")
                    .font(.title)
            })
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(Color.blue)
            .cornerRadius(20)
        }
//            GeometryReader{
//                geometry in
//            VStack {
//
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                    Text("CBT")
//                        .font(.title)
//                }
//                .buttonStyle(.plain)
//                .frame(maxWidth: .infinity)
//                .frame(height: (geometry.size.height/2))
//                .background(Color.blue)
//                .cornerRadius(3)
//
//            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                Text("Breathe")
//                    .font(.title)
//            }
//            .buttonStyle(.plain)
//            .frame(maxWidth: .infinity)
//            .frame(height: (geometry.size.height/2))
//            .background(Color.blue)
//            .cornerRadius(3)
//            }
//
//            }
    }
}
struct CopeView_Previews: PreviewProvider {
    static var previews: some View {
        CopeView()
    }
}
