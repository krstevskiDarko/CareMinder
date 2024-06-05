//
//  AppLogoView.swift
//  CareMinder
//
//  Created by Darko Krstevski on 10.02.2023.
//

import SwiftUI

/**
 
 The loading screen when initially opening StepByStep.
 
 */

struct AppLogoView: View {
    var body: some View {
        // Create a ZStack to place elements on top of each other
        ZStack {
            Color(UIColor(red: 0.64, green: 0.67, blue: 0.94, alpha: 0.5)).edgesIgnoringSafeArea(.all)
            
            // Create a VStack to vertically stack the elements
            VStack(spacing: 50) {
                // Display the app icon image with specified size and aspect ratio
                Image("app icon@4x")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                // Display a "Loading..." text with custom font and color
                Text("Loading...")
                    .font(Font.system(size: 55, weight: .bold))
                    .foregroundColor(.white)
            }
            // Add vertical padding to the VStack
            .padding(.vertical, 30.0)
        }
    }    
}
