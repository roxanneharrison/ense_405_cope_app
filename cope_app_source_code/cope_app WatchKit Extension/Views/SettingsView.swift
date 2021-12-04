//
//  SettingsView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-11-19.
//

import SwiftUI

struct SettingsView: View {
    // Color settings
    @AppStorage("user_color") var user_color: String = "blue"
    private var color = ["blue","green", "pink", "purple", "red", "yellow"]
    // Check in frequency
    @AppStorage("user_check_in_mantra") var user_check_in_mantra: Int = 3
    private var check_in_mantra = [1,2,3,4,5,6]
    @AppStorage("user_check_in_breathe") var user_check_in_breathe: Int = 3
    private var check_in_breathe = [1,2,3,4,5,6]
    // Breathing technique
    @AppStorage("user_breath_length") var user_breath_length: Double = 3.0
    private var breathe_inhale = [1,2,3,4,5,6]
    @AppStorage("user_hold_length") var user_hold_length: Double = 3.0
    private var breathe_hold = [0,1,2,3,4,5]

    
    var body: some View {
        ScrollView(){
            VStack{
        Text("Settings")
                    .font(.title)
                Group{Text("Accent Color")
        HStack{
            
            ForEach(color, id: \.self){colorName in
                Circle()
                    .fill(Color(colorName))
                    .frame(width: 20, height:20)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: user_color == colorName ? 2: 0)
                    ).onTapGesture {
                        user_color = colorName // Update app storage
                    }
            }
        }}
                Group{Text ("Mantra Check-In")
                HStack{
                    
                    ForEach(check_in_mantra, id: \.self){checkIn_mantra in
                        Circle()
                            Text("\(checkIn_mantra)")
                            .frame(width: 20, height:20)
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: user_check_in_mantra == checkIn_mantra ? 2: 0)
                            ).onTapGesture {
                                user_check_in_mantra = checkIn_mantra // Update app storage
                            }
                    }
                }}
                Group{Text ("Breathe Check-In")
                        HStack{
                            
                            ForEach(check_in_breathe, id: \.self){checkIn_breathe in
                                Circle()
                                    Text("\(checkIn_breathe)")
                                    .frame(width: 20, height:20)
                                    .overlay(
                                        Circle().stroke(Color.white, lineWidth: user_check_in_breathe == checkIn_breathe ? 2: 0)
                                    ).onTapGesture {
                                        user_check_in_breathe = checkIn_breathe // Update app storage
                                    }
                            }
                        }}
                Group{Text ("Breathe Length")
                        HStack{
                            
                            ForEach(breathe_inhale, id: \.self){inhale in
                                Circle()
                                    Text("\(inhale)")
                                    .frame(width: 20, height:20)
                                    .overlay(
                                        Circle().stroke(Color.white, lineWidth: user_breath_length == Double(inhale) ? 2: 0)
                                    ).onTapGesture {
                                        user_breath_length = Double(inhale) // Update app storage
                                    }
                            }
                        }}
                Group{Text ("Breathe Hold Length")
                        HStack{
                            
                            ForEach(breathe_hold, id: \.self){hold in
                                Circle()
                                    Text("\(hold)")
                                    .frame(width: 20, height:20)
                                    .overlay(
                                        Circle().stroke(Color.white, lineWidth: user_hold_length == Double(hold) ? 2: 0)
                                    ).onTapGesture {
                                        user_hold_length = Double(hold) // Update app storage
                                    }
                            }
                        }}
                
            }
        }// : Scrollview
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
