//
//  BreatheView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-11-12.
//

import SwiftUI

struct BreatheView: View {
    @AppStorage("user_color") var user_color: String = "blue"
    // Initialize variables
    @State var breath_state = "Inhale"
    @State var timer_value: Float = 0
    @State var hold_count: Float = 0
    @State var check_in_monitor = 0
    @State var check_in_state = false
    // User variables (MVP 3)
    @AppStorage("user_breath_length") var user_breath_length :Double = 3.0
    @AppStorage("user_hold_length") var user_hold_length :Double = 3.0
//    @State var user_breath_length: Float = 3
//    @State var user_hold_length: Float = 3
    @AppStorage("user_check_in_breathe") var user_check_in_breathe: Int = 3

    
    var body: some View {
        VStack{
        Text("\(breath_state)")
                .font(.system(size: 30))
            ZStack{
                Circle()
                    .fill(Color(user_color))
                    .frame(width: CGFloat(Double(timer_value)/Double(user_breath_length))*100)
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
                        if Int(self.timer_value) == Int(user_breath_length){
                            breath_state = "Hold"
                        }
                    }else if breath_state == "Hold"{ // Hold state
                        self.hold_count += 1
                        if Int(self.hold_count) == Int(user_hold_length){
                            breath_state = "Exhale"
                            self.hold_count = 0
                        }
                    }else{ // Exhale state
                        self.timer_value -= 1
                        if self.timer_value == 0{
                            breath_state = "Inhale"
                            self.check_in_monitor += 1
                            // User check in
                            if check_in_monitor == user_check_in_breathe{
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
    @AppStorage("user_color") var user_color: String = "blue"
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
struct BreatheView_Previews: PreviewProvider {
    static var previews: some View {
        BreatheView()
    }
}
