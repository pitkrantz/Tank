//
//  LightButton.swift
//  Tank
//
//  Created by Pit Krantz on 28/04/2022.
//

import SwiftUI

struct LightButton: View {
    @ObservedObject var viewModel: TankViewModel
    
    var body: some View {
        Button(action: {
            if !viewModel.connected{
                viewModel.lightStatus = false
            }
            
            else if viewModel.lightStatus {
                viewModel.lightStatus = false
                
                viewModel.lightInput(0)
                viewModel.send()
                //SoundManager.instance.playSound(sound: .light)

            }
            
            else{
                viewModel.lightStatus = true
                
                viewModel.lightInput(10)
                viewModel.send()
                //SoundManager.instance.playSound(sound: .light)

            }
            
            
        }, label: {
            if viewModel.lightStatus {
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 25))
                    .foregroundColor(.yellow)
                    .frame(width: 120, height: 70)
                    .background(.black)
            }
            else if !viewModel.lightStatus || !viewModel.connected{
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                    .frame(width: 120, height: 70)
                    .background(.black)
            }
        })
        .padding()
        .buttonStyle(toggleSwitch())
    }
}

struct LightButton_Previews: PreviewProvider {
    static var previews: some View {
        LightButton(viewModel: TankViewModel())
    }
}
