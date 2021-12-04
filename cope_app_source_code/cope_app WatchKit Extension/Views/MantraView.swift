//
//  CBTView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-23.
//

import SwiftUI



// Create cue array and shuffle elements
let shuffled_cues = cues.shuffled()

struct MantraView: View {
    @AppStorage("user_check_in_mantra") var user_check_in_mantra: Int = 3
    @AppStorage("user_color") var user_color: String = "blue"
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
                    if cue_counter == user_check_in_mantra{
                        self.check_in = true
                    }
                    cue_counter += 1
                    random_cue = shuffled_cues.randomElement()!
                }
                .background(Color(user_color))
                .cornerRadius(20)
            }
    }
    }
}
struct MantraCheckIn: View {
    @AppStorage("user_color") var user_color: String = "blue"
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
                    .background(Color(user_color))
                    .cornerRadius(20)

                NavigationLink(
                    destination: CopeView(),
                    label: {
                        Text("Exit")
                    })
                    .foregroundColor(Color.white)
                    .buttonStyle(.borderless)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color(user_color))
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
