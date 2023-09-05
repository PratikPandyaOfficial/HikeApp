//
//  GradiantButtonStyle.swift
//  HikeApp
//
//  Created by Drashti on 21/08/23.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional statement with nil coalescing
                // Condition ? A : B
                configuration.isPressed ?
                // A when user press button
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                // B when button is not press
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
