//
//  ContentViewModel.swift
//  CustomLoader
//
//  Created by Kristina Matijasic on 18.02.2024..
//

import Foundation
import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
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
