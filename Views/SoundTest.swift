//
//  SoundTest.swift
//  Tank
//
//  Created by Pit Krantz on 25/04/2022.
//

import SwiftUI
import AVKit


class SoundManager{
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String{
        case connected
        case disconnected
        case light
    }
    
    func playSound(sound: SoundOption){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error{
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
}

struct SoundTest: View {
    var body: some View {
        VStack{
            Button(action: {
              print("Sound 1 playing...")
                SoundManager.instance.playSound(sound: .light)
            }, label: {
               Text("Sound 1")
            })

        }
    }
}

struct SoundTest_Previews: PreviewProvider {
    static var previews: some View {
        SoundTest()
    }
}
