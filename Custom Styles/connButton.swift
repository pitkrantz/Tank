//
//  newButton.swift
//  Tank
//
//  Created by Pit Krantz on 28/01/2022.
//

import SwiftUI

struct connectButton: ButtonStyle{
    @State var status: Bool = false
    func makeBody(configuration: Configuration) -> some View {
        if status == false{
        configuration.label
            .frame(height: 70, alignment: .center)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .scaleEffect(configuration.isPressed ? 0.9: 1.0)
        }
        if status == true{
        configuration.label
            .frame(height: 70, alignment: .center)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .scaleEffect(configuration.isPressed ? 0.9: 1.0)
        }
            
    }
}

struct newButton: View {
    var body: some View {
        Button(action: {}) {Text("10")}
        .buttonStyle(connectButton())
    }
}

struct newButton_Previews: PreviewProvider {
    static var previews: some View {
        newButton()
    }
}
