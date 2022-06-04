//
//  ToggleLight.swift
//  Tank
//
//  Created by Pit Krantz on 29/04/2022.
//

import SwiftUI

struct toggleSwitch: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .cornerRadius(8.0)
            .scaleEffect(configuration.isPressed ? 0.9: 1.0)
            
            
    }
}

struct ToggleLight_Test: View {
    @State var currentLight: Bool = false
    var body: some View {
        Button(action: {
            if currentLight {
                currentLight = false
                
                //SoundManager.instance.playSound(sound: .light)

            }
            
            else{
                currentLight = true
                //SoundManager.instance.playSound(sound: .light)

            }
            
            
        }, label: {
            if currentLight {
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.white)
                    .frame(width: 120, height: 70)
                    .background(.black)
            }
            else {
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.gray)
                    .frame(width: 120, height: 70)
                    .background(.black)
            }
        })
        .padding(40)
        .buttonStyle(toggleSwitch())
    }
}

struct ToggleLight_Previews: PreviewProvider {
    static var previews: some View {
        ToggleLight_Test()
    }
}
