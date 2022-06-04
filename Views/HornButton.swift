//
//  HornButton.swift
//  Tank
//
//  Created by Pit Krantz on 14/04/2022.
//

import SwiftUI

struct HornButton: View {
    @ObservedObject var viewModel: TankViewModel
    
    var body: some View {
        HStack{
            Button(action: {
                viewModel.hornInput(10)
                viewModel.send()
                viewModel.hornInput(0)
                usleep(300 * 1000)
                viewModel.send()
            }, label: {
                Text("Horn!")
                    .font(.system(size: 30, weight: .black, design: .default))
                    .foregroundColor(.white)
                    .frame(width: 120, height: 70)
                    .background(.gray)
                    
            })
            .padding()
            .buttonStyle(toggleSwitch())
            
        }
    }
}

struct HornButton_Previews: PreviewProvider {
    static var previews: some View {
        HornButton(viewModel: TankViewModel())
    }
}
