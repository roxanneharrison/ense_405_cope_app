//
//  CBTView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-23.
//

import SwiftUI


// User check in count of cues
var check_in_count = 3
// Create cue array and shuffle elements
let shuffled_cues = cues.shuffled()

struct MantraView: View {

    @State var random_cue: String = shuffled_cues.randomElement()!
    @State var cue_counter: Int = 1
    @State var check_in = false

    
    var body: some View {
        
            GeometryReader{
                geometry in
            VStack {
                ZStack{
                Text(random_cue)
                .font(.system(size: 20))
                NavigationLink(destination: MantraCheckIn(), isActive: $check_in) {}
                .hidden()
                }
                Spacer()
                Button("Next") {
                    print("Count number: \(cue_counter)")
                    // Increment and update CBT cue
                    if cue_counter == check_in_count{
                        self.check_in = true
                    }
                    cue_counter += 1
                    random_cue = shuffled_cues.randomElement()!
                }
                .background(user_color)
                .cornerRadius(20)
            }
    }
    }
}
struct MantraCheckIn: View {

    var body: some View {
        
            GeometryReader{
                geometry in
                VStack{
                    Text("Do you feel you need to continue?")
                    Spacer()
                NavigationLink(
                    destination: MantraView(),
                    label: {
                        Text("Continue")
                    })
                    .foregroundColor(Color.white)
                    .buttonStyle(.borderless)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(user_color)
                    .cornerRadius(20)

                NavigationLink(
                    destination: ContentView(),
                    label: {
                        Text("Exit")
                    })
                    .foregroundColor(Color.white)
                    .buttonStyle(.borderless)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(user_color)
                    .cornerRadius(20)

                }
    }
    }
}

struct CBTView2_Previews: PreviewProvider {
    static var previews: some View {
        MantraView()
    }
}
