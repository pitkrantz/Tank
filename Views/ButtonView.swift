//
//  ButtonView.swift
//  Tank
//
//  Created by Pit Krantz on 28/01/2022.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var viewModel: TankViewModel
    
    var body: some View {
        HStack(){
            if viewModel.connected{
                Button(action: {
                    viewModel.lightInput(0)
                    viewModel.lightStatus = false
                    viewModel.send()
                    usleep(200*1000)
                    viewModel.disconnectTank()
                    SoundManager.instance.playSound(sound: .disconnected)
                    
                }, label: {
                    Text("Disconnect")
                        
                        .padding()
                        .frame(maxWidth: .infinity)
                        .padding()
                })
                    .buttonStyle(connectButton(status: true))
            }
            
            else{
                Button(action: {
                    viewModel.connectTank()
                    SoundManager.instance.playSound(sound: .connected)
                }, label: {
                    Text("Connect")
                        
                        .padding()
                        .frame(maxWidth: .infinity)
                        .padding()
                })
                    .buttonStyle(connectButton(status: false))
            }
        }
        .frame(width: 220)
        .padding(.top)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var viewModel = TankViewModel()
    static var previews: some View {
        ButtonView(viewModel: viewModel)
    }
}
