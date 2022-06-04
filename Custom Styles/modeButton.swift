//
//  modeButton.swift
//  Tank
//
//  Created by Pit Krantz on 04/02/2022.
//

import SwiftUI


struct modeButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height:60, alignment: .center)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8.0)
        
    }
}


struct modeButton_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            
        } label: {
            Text("Placeholder")
        }
        .buttonStyle(modeButton())

    }
}
