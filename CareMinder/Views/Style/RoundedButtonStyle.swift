//
//  RoundedButtonStyle.swift
//  CareMinder
//
//  Created by Darko Krstevski on 10.02.2023.
//

import Foundation
import SwiftUI

/**
 Style for buttons in AddGoalView
 */

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            let pressed = configuration.isPressed
            return GeometryReader { geometry in
                configuration.label
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.35)
                    .padding(11)
                    .background(
                        Color("LightPurple")
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("LightPurple"), lineWidth: 2)
                            )
                            .cornerRadius(20)
                    )
                    .scaleEffect(pressed ? 0.95 : 1.0)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
