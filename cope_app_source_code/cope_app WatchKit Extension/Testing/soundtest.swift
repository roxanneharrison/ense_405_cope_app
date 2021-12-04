//
//  soundtest.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-24.
//

import SwiftUI
import AVKit
import AVFoundation

struct soundtest: View {
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
            VStack {
                    Text("Play").font(.system(size: 45)).font(.largeTitle)
                HStack {
                    Spacer()
                    Button(action: {
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "play.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    Button(action: {
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "pause.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                }
            }
        .onAppear {
            let path = Bundle.main.path(forResource: "song", ofType: "mp3")
            print(path!)
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        }
    }
}

struct soundtest_Previews: PreviewProvider {
    static var previews: some View {
        soundtest()
    }
}
