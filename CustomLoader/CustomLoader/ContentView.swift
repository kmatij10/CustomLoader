//
//  ContentView.swift
//  CustomLoader
//
//  Created by Kristina Matijasic on 18.02.2024..
//

import SwiftUI
import Combine

class LoaderViewModel: ObservableObject {
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()

    func imitateAPICall() {
        isLoading = true

        // Simulate an API call with a 3-second delay
        Just(())
            .delay(for: .seconds(3), scheduler: RunLoop.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] _ in
                self?.isLoading = false
            })
            .store(in: &cancellables)
    }
}

struct ContentView: View {
    var body: some View {
        CircleLoaderView()
    }
}

struct CircleLoaderView: View {
    @StateObject private var viewModel = LoaderViewModel()

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
