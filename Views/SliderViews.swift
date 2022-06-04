//
//  Slider Test.swift
//  Tank
//
//  Created by Pit Krantz on 16/01/2022.
//

import SwiftUI


struct LeftSlider: View{
    
    @ObservedObject var viewModel: TankViewModel
    
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height - UIScreen.main.bounds.height/4
    
    @State var sliderValueL: CGFloat = 0.5
    
    
    @State var sliderHeightL: CGFloat = (UIScreen.main.bounds.height - UIScreen.main.bounds.height/4)/2
    
    var body: some View{
        
        ZStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(Color("SliderColor").opacity(0.25))
                
                Rectangle()
                    .fill(Color("SliderColor"))
                    .frame(height: sliderHeightL)
                
                Rectangle()
                    .fill(.black)
                    .frame(width: 150, height: 3)
                    .offset(y: -maxHeight/2)
            }
            .frame(width: 150, height: maxHeight)
            .cornerRadius(15)
            .overlay(
            Text("\(Int((sliderValueL * 100) - 50) * 2)%")
                .font(.system(size: 25, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
                .position(x: 75, y: -15)
            
            )
            .gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
                
                let translationL = value.translation
                
                sliderHeightL = -translationL.height + maxHeight/2
                
                sliderHeightL = sliderHeightL >= 0 ? sliderHeightL: 0
                
                sliderHeightL = sliderHeightL > maxHeight ? maxHeight: sliderHeightL
                
                let progressL = sliderHeightL / maxHeight
                
                sliderValueL = progressL <= 1.0 ? progressL: 1
            
                let sendDataL: Int = Int(sliderValueL * 255)
                viewModel.getValueL(sendDataL)
                viewModel.send()
                
                
            })
                        .onEnded({ (value) in
                
                sliderHeightL = maxHeight/2
                
                
                
                sliderHeightL = sliderHeightL >= 0 ? sliderHeightL: 0
                
                sliderHeightL = sliderHeightL > maxHeight ? maxHeight: sliderHeightL
                
                let progressL = sliderHeightL / maxHeight
                
                sliderValueL = progressL <= 1.0 ? progressL: 1
                
                let sendDataL = Int(sliderValueL * 255)
                viewModel.getValueL(sendDataL)
                viewModel.send()
                            
            }))
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor").ignoresSafeArea())
        
    }
}

struct RightSlider: View{
    
    @ObservedObject var viewModel: TankViewModel
    
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height - UIScreen.main.bounds.height/4
    
    @State var sliderValueR: CGFloat = 0.5
    
    @State var sliderHeightR: CGFloat = (UIScreen.main.bounds.height - UIScreen.main.bounds.height/4)/2
    
    var body: some View{
        
        ZStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(Color("SliderColor").opacity(0.25))
                
                Rectangle()
                    .fill(Color("SliderColor"))
                    .frame(height: sliderHeightR)
                
                Rectangle()
                    .fill(.black)
                    .frame(width: 150, height: 3)
                    .offset(y: -maxHeight/2)
            }
            .frame(width: 150, height: maxHeight)
            .cornerRadius(15)
            .overlay(
            Text("\(Int((sliderValueR * 100) - 50) * 2)%")
                .font(.system(size: 25, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
                .position(x: 75, y: -15)
            
            )
            .gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
                
                let translationR = value.translation
                
                sliderHeightR = -translationR.height + maxHeight/2
                
                sliderHeightR = sliderHeightR >= 0 ? sliderHeightR: 0
                
                sliderHeightR = sliderHeightR > maxHeight ? maxHeight: sliderHeightR
                
                let progressR = sliderHeightR / maxHeight
                
                sliderValueR = progressR <= 1.0 ? progressR: 1
                
                let sendDataR: Int = Int(sliderValueR * 255)
                viewModel.getValueR(sendDataR)
                viewModel.send()
    
                
            })
                        .onEnded({ (value) in
                
                sliderHeightR = maxHeight/2
                
                
                
                sliderHeightR = sliderHeightR >= 0 ? sliderHeightR: 0
                
                sliderHeightR = sliderHeightR > maxHeight ? maxHeight: sliderHeightR
                
                let progressR = sliderHeightR / maxHeight
                
                sliderValueR = progressR <= 1.0 ? progressR: 1
                            
                let sendDataR: Int = Int(sliderValueR * 255)
                viewModel.getValueR(sendDataR)
                viewModel.send()
    
            }))
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor").ignoresSafeArea())
        
    }
}


struct Slider_Test_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            LeftSlider(viewModel: TankViewModel())
                .previewInterfaceOrientation(.landscapeRight)
        }
            
    }
}
