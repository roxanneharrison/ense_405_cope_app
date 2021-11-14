//
//  BreatheView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-11-12.
//

import SwiftUI

struct BreatheView: View {
    // Initialize variables
    @State var breath_state = "Inhale"
    @State var timer_value: Float = 0
    @State var hold_count: Float = 0
    @State var check_in_monitor = 0
    @State var check_in_state = false
    // User variables (MVP 3)
    @State var user_breath_length: Float = 3
    @State var user_hold_length: Float = 3
    @State var user_check_in_count = 2

    
    var body: some View {
        VStack{
        Text("\(breath_state)")
                .font(.system(size: 30))
            ZStack{
                Circle()
                    .fill(user_color)
                    .frame(width: CGFloat(timer_value/user_breath_length)*100)
                Circle()
                    .stroke(Color.white)
                // Navigate to check in screen after so many breaths
                NavigationLink(destination: BreatheCheckIn(), isActive: $check_in_state) {}
                .hidden()
        Text(" \(Int(timer_value)) ")
            .font(.system(size: 60))
            .onAppear(){
                // Use phone timer to count up and down
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){timer in
                    if breath_state == "Inhale"{ // Inhale state
                        self.timer_value += 1
                        if self.timer_value == user_breath_length{
                            breath_state = "Hold"
                        }
                    }else if breath_state == "Hold"{ // Hold state
                        self.hold_count += 1
                        if self.hold_count == user_hold_length{
                            breath_state = "Exhale"
                            self.hold_count = 0
                        }
                    }else{ // Exhale state
                        self.timer_value -= 1
                        if self.timer_value == 0{
                            breath_state = "Inhale"
                            self.check_in_monitor += 1
                            // User check in
                            if check_in_monitor == user_check_in_count{
                                self.check_in_state = true
                                self.check_in_monitor = 0
                            }
                        }
                    }

                    }
                }
        }
    }
}

}

struct BreatheCheckIn: View {

    var body: some View {
        
            GeometryReader{
                geometry in
                VStack{
                    Text("Do you feel you need to continue?")
                    Spacer()
                NavigationLink(
                    destination: BreatheView(),
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
struct BreatheView_Previews: PreviewProvider {
    static var previews: some View {
        BreatheView()
    }
}
