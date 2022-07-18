//
//  HornButton.swift
//  Tank
//
//  Created by Pit Krantz on 14/04/2022.
//

import SwiftUI

struct TurboButton: View {
    @ObservedObject var viewModel: TankViewModel
    
    var body: some View {
        HStack{
            Button(action: {
                viewModel.knightRider.toggle()
                viewModel.kittInput()
                viewModel.send()
            }, label: {
                Text("Turbo\nBoost")
                    .font(.system(size: 25, weight: .regular, design: .monospaced))
                    .foregroundColor(.black)
                    .frame(width: 120, height: 70)
                    .background(.red)
                    .opacity(viewModel.knightRider ? 1 : 0.5)
                    
            })
            .padding()
            .buttonStyle(toggleSwitch())
            
        }
    }
}

struct HornButton_Previews: PreviewProvider {
    static var previews: some View {
        TurboButton(viewModel: TankViewModel())
    }
}
