//
//  ThemeView.swift
//  Tank
//
//  Created by Pit Krantz on 06/06/2022.
//

import SwiftUI

struct ThemeView: View {
    //@State var selected: Bool = false
    
    @State var themes = [
        Theme(name: "default", photo: "Screenshot1", selected: true),
        Theme(name: "default", photo: "Screenshot1", selected: false),
        Theme(name: "default", photo: "Screenshot1", selected: false),
        Theme(name: "default", photo: "Screenshot1", selected: false),
    ]
    
    let themeWidth: CGFloat = 240
    let themeHeight: CGFloat = 120
    
    var body: some View {
        
        ForEach(themes) { currentTheme in
            VStack {
                Button(action:{
                    withAnimation(.spring(response: 0.3)) {
                        currentTheme.selected.toggle()
                    }
                    
                }, label: {
                    if(currentTheme.selected) {
                            ZStack {
                                Image("Screenshot1")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(8)
                                    .frame(width: themeWidth, height: themeHeight)
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke()
                                    .foregroundColor(.green)
                                    .frame(width: themeWidth + 18, height: themeHeight + 10)
                            }
                        }
                        else{
                            ZStack {
                                Image("Screenshot1")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(8)
                                    .frame(width: themeWidth-20, height: themeHeight-20)

                            }
                        }
                })
                .buttonStyle(toggleSwitch())
                .padding()
            Text("default")

            
            }
        }
       
        
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
