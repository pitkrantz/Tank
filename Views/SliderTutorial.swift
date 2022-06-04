//
//  SliderTest.swift
//  Tank
//
//  Created by Pit Krantz on 16/01/2022.
//

import SwiftUI

struct SliderTutorial: View {
    var body: some View {
        Home()
    }
}

struct SliderTutorial_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct Home:View{
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height / 3
    //Slider Properties...
    @State var sliderProgess: CGFloat = 0
    @State var sliderHeight: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    
    
    var body: some View{
        NavigationView{
            VStack{
                
                //Slider
                ZStack(alignment: .bottom, content: {
                    Rectangle()
                        .fill(Color("SliderColor").opacity(0.15))
                    
                    Rectangle()
                        .fill(Color("SliderColor"))
                        .frame(height: sliderHeight)
            
                })
                    .frame(width:100, height: maxHeight)
                    .cornerRadius(20)
                //Container...
                    .overlay(
                        Text("\(Int(sliderProgess * 100))%")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 18)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.vertical, 30)
                            .offset(y: sliderHeight < maxHeight - 105 ? -sliderHeight: -maxHeight + 105 )
                        
                        ,alignment: .bottom
                        
                    )
                    .gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
                            
                        //getting drag values
                        
                        let translation = value.translation
                        
                        sliderHeight = -translation.height + lastDragValue
                        
                        //limiting slider height value...
                        
                        sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                        
                        sliderHeight = sliderHeight >= 0 ? sliderHeight: 0
                       
                        //updating sliderProgress...
                        
                        let progress = sliderHeight / maxHeight
                        
                        sliderProgess = progress <= 1.0 ? progress: 1
                        
                    }).onEnded({ (value) in
                       
                        //lastDragValue = sliderHeight
                        
                        sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                        
                        // negative height...
                        sliderHeight = sliderHeight >= 0 ? sliderHeight: 0
                        
                        //storing last drag value...
                        lastDragValue = sliderHeight
                        
                        
                    }))
                    
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor").ignoresSafeArea())
            .navigationTitle("Slider Test")
        }
    }
}
