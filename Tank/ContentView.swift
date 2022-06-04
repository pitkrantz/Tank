//
//  ContentView.swift
//  Tank
//
//  Created by Pit Krantz on 09/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TankViewModel()
    
    var body: some View {
        HStack(spacing: -30){
            LeftSlider(viewModel: viewModel)
                .padding()
            
            VStack(spacing: -25){
                ButtonView(viewModel: viewModel)
                    .padding(.top)
                Text(viewModel.output)
                    .frame(width: 300, height: 50, alignment: .center)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.top)
                 Spacer()
                HStack{
                    NewLightButton(viewModel: viewModel)
                    HornButton(viewModel: viewModel)

                }
                
                Spacer()
            }
            
            RightSlider(viewModel: viewModel)
                .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor").ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
