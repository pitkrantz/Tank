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
                pressed.toggle()
        }, label: {
            ZStack{
                Circle()
                    .opacity(pressed ? 100 : 0)
                    .frame(width: 40, height: 40, alignment: .center)
                    .animation(.easeInOut, value: 1)
                Image(systemName: "paintbrush")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(pressed ? .white : .black)
                    .animation(.spring(response: 0.3), value: 1)
                
            }
           
                
        })
        .buttonStyle(toggleSwitch())
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsWheel()
    }
}
