//
//  NewLightButton.swift
//  Tank
//
//  Created by Pit Krantz on 04/06/2022.
//

import SwiftUI

struct NewLightButton: View {
    @ObservedObject var viewModel: TankViewModel
    
    var body: some View {
        Button(action: {
            if !viewModel.connected{
                withAnimation(.spring()){
                    viewModel.lightStatus = false
                }
            }
            
            else if viewModel.lightStatus {
                withAnimation(.spring()){
                    viewModel.lightStatus = false
                }
                
                
                viewModel.lightInput(0)
                viewModel.send()
                //SoundManager.instance.playSound(sound: .light)

            }
            
            else{
                withAnimation(.spring()){
                    viewModel.lightStatus = true
                }
                
                viewModel.lightInput(10)
                viewModel.send()
                //SoundManager.instance.playSound(sound: .light)

            }
            
            
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: viewModel.lightStatus ? 100 : 8)
                    .foregroundColor(.black)
                    .frame(
                        width: viewModel.lightStatus ? 70 : 120,
                        height: viewModel.lightStatus ? 70: 70
                )
                
                Image(systemName: viewModel.lightStatus ? "sun.max.fill" : "sun.min.fill")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(viewModel.lightStatus ? .yellow : .gray)
                    .rotationEffect(Angle(degrees: viewModel.lightStatus ? 90 : 0))
            }
            .frame(width: 120, height: 70, alignment: .center)
            
        })
        .padding()
        .buttonStyle(toggleSwitch())
    }
}

struct NewLightButton_Previews: PreviewProvider {
    static var previews: some View {
        NewLightButton(viewModel: TankViewModel())
    }
}
