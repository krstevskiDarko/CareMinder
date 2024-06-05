//
//  ContentTitleView.swift
//  CareMinder
//
//  Created by Darko Krstevski on 10.02.2023.
//

import Foundation
import SwiftUI

/**
 ContentView title styling and display
 */

struct ContentTitleView: View {
    var body: some View {
        Text("Now let's set the specifics of\nyour goal and habit :)")
            .font(.system(size: 24))
            .fontWeight(.bold)
            .foregroundColor(CustomColor.textColor)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }
}

