//
//  HabitButtonStyle.swift
//  CareMinder
//
//  Created by Darko Krstevski on 10.02.2023.
//

import Foundation
import SwiftUI

/**
 Style for buttons in AddHabitsView
 */

struct HabitButtonStyle: ButtonStyle {
    @Binding var selected: String
    let identifier: String
    
    func makeBody(configuration: Configuration) -> some View {
        let pressed = configuration.isPressed
        
        return GeometryReader { geometry in
            configuration.label
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.35)
                .padding(11)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(selected == identifier ? Color("AccentColor") : Color("LightPurple"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("LightPurple"), lineWidth: selected == identifier ? 0 : 2)
                        )
                )
                .scaleEffect(pressed ? 0.95 : 1.0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .onTapGesture {
                    if selected == identifier {
                        // Deselect the button if it's already selected
                        selected = ""
                    } else {
                        // Select the button
                        selected = identifier
                    }
                }
        }
    }
}
