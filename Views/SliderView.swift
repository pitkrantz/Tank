//
//  SliderView.swift
//  Tank
//
//  Created by Pit Krantz on 12/01/2022.
//

import SwiftUI

struct SliderView: View {
   var screenHeight: CGFloat = UIScreen.main.bounds.height
   var screenWidth: CGFloat = UIScreen.main.bounds.width
        
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.gray)
                .frame(width: 150, height: 300)
                .position(x: screenWidth/2 - 200, y: screenHeight/2)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SliderView()
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
