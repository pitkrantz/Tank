//
//  SettingsWheel.swift
//  Tank
//
//  Created by Pit Krantz on 05/06/2022.
//

import SwiftUI

struct SettingsWheel: View {
    
    @State var pressed: Bool = false
    
    var body: some View {
        Button(action:{
            withAnimation(.spring(response: 0.3)) {
                pressed.toggle()
            }
        }, label: {
            Image(systemName: "gearshape.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.black)
                .rotationEffect(Angle(degrees: pressed ? 180 : 0))
        })
        .buttonStyle(toggleSwitch())
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsWheel()
    }
}
