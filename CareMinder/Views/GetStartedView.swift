//
//  GetStartedView.swift
//  CareMinder
//
//  Created by Darko Krstevski on 11.02.2023.
//

import Foundation
import SwiftUI

/**
 
 The initial get started screen for new users to StepByStep.
 
 */

struct GetStartedView: View {
    var body: some View {
        // Create a ZStack to place elements on top of each other
        ZStack {
            // Set the background color to a light beige color and ignore the safe area
            Color(UIColor(red: 0.64, green: 0.67, blue: 0.94, alpha: 0.5)).edgesIgnoringSafeArea(.all)
            
            // Create a VStack to vertically stack the elements
            VStack(spacing: 30) {
                // Create empty space between the two text elements
                Spacer()
                // Display a greeting text with custom font and color
                Text("Hi There!\n\nLET'S HELP YOU GET STARTED")
                    .font(Font.system(size: 45, weight: .bold))
                    .foregroundColor(.accentColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                Spacer()
            }
            // Add vertical padding to the VStack
            .padding(.vertical, 30.0)
        }
    }
}

