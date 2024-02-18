//
//  CustomLoader.swift
//  CustomLoader
//
//  Created by Kristina Matijasic on 18.02.2024..
//

import Foundation
import SwiftUI

struct CustomLoaderView: View {
    @State private var rotateInfinitely = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 4)
                .opacity(0.3)
                .foregroundColor(Color.purple)

            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.purple, lineWidth: 4)
                .rotationEffect(Angle(degrees: rotateInfinitely ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: rotateInfinitely)
        }
        .frame(width: 40, height: 40)
        .onAppear {
            rotateInfinitely = true
        }
    }
}
