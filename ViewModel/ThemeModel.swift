//
//  ThemeModel.swift
//  Tank
//
//  Created by Pit Krantz on 06/06/2022.
//

import Foundation
import SwiftUI


//class ThemeModel: ObservableObject {
//
//    @Published var sliderColor: Color = Color("Slidercolor")
//    @Published var backgroundColor: Color = Color("BackgroundColor")
//
//    @Published var allThemes: [Bool] = [true, false, false, false] //store all the states and change one to true
//
//
//}
//
//class Theme: Identifiable {
//
//    var id = UUID()
//
//    @Published var photo: String
//    @Published var name: String
//    @Published var state: Bool
//
//    init(photo: String, name: String, state: Bool){
//        self.photo = photo
//        self.name = name
//        self.state = state
//    }
//
//}


class Theme: Identifiable {
    let id = UUID()
    
    let name: String
    let photo: String
    var selected: Bool
    
    init(name: String, photo: String, selected: Bool){
        self.name = name
        self.photo = photo
        self.selected = selected
    }
}

class allThemes {
    let themes = [
        Theme(name: "default", photo: "Screenshot1", selected: true),
        Theme(name: "default", photo: "Screenshot1", selected: false),
        Theme(name: "default", photo: "Screenshot1", selected: false),
        Theme(name: "default", photo: "Screenshot1", selected: false),
    ]
    
}

class SettingsButtonPressed: ObservableObject {
    @Published var buttonPressed: Bool = false
}
