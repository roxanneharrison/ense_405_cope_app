//
//  BreatheTest.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-11-12.
//

import SwiftUI

struct BreatheTest: View {
    // Initialize variables
    @State var breathStatus = "Inhale"
    @State var timerVal: Float = 0
    @State var temp: Float = 0
    @State var check_in_monitor = 0
    @State var check_in = false
    // User variables (MVP 3)
    @State var breathLength: Float = 4
    @State var holdLength: Float = 4
    @State var check_in_count = 2

    
    var body: some View {
        VStack{
        Text("\(breathStatus)")
                .font(.system(size: 30))
            ZStack{
                Circle()
                    .fill(user_color)
                    .frame(width: CGFloat(timerVal/breathLength)*100)
                Circle()
                    .stroke(Color.white)
                // Navigate to check in screen after so many breaths
                NavigationLink(destination: BreatheCheckInView(), isActive: $check_in) {}
                .hidden()
        Text(" \(Int(timerVal)) ")
            .font(.system(size: 60))
            .onAppear(){
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){timer in
                    if breathStatus == "Inhale"{
                        self.timerVal += 1
                        if self.timerVal == breathLength{
                            breathStatus = "Hold"
                        }
                    }else if breathStatus == "Hold"{
                        self.temp += 1
                        if self.temp == holdLength{
                            breathStatus = "Exhale"
                            self.temp = 0
                        }
                    }else{
                        self.timerVal -= 1
                        if self.timerVal == 0{
                            breathStatus = "Inhale"
                            self.check_in_monitor += 1
                            print(check_in_monitor)
                            if check_in_monitor == check_in_count{
                                self.check_in = true
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

struct BreatheCheckInView: View {

    var body: some View {
        
            GeometryReader{
                geometry in
                VStack{
                    Text("Do you feel you need to continue?")
                    Spacer()
                NavigationLink(
                    destination: BreatheTest(),
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
struct BreatheTest_Previews: PreviewProvider {
    static var previews: some View {
        BreatheTest()
    }
}
