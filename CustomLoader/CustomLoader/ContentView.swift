//
//  ContentView.swift
//  CustomLoader
//
//  Created by Kristina Matijasic on 18.02.2024..
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            Button("Imitate API Call") {
                viewModel.imitateAPICall()
            }

            if viewModel.isLoading {
                CustomLoaderView()
            }
        }
    }
}
