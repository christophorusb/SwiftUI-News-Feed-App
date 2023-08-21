//
//  ImageService.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 12/08/23.
//

import SwiftUI
import Moya
import Combine

class ImageService: ObservableObject {
    // Published property that will trigger a view update when the image is loaded.
    @Published var image: UIImage? = nil

    // Using this to keep track of the ongoing network request.
    private var cancellable: AnyCancellable?
    
    // Moya's provider, used to make network requests.
    private let provider = MoyaProvider<ImageAPIServices>()

    // Cancel the network request if it's still ongoing when the object is deallocated.
    deinit {
        cancellable?.cancel()
    }

    // Function to load an image given its path.
    func load(path: String) {
        cancellable = provider.requestPublisher(.fetchImage(path: path))
            .map { UIImage(data: $0.data) } // Convert the received data to a UIImage.
            .receive(on: DispatchQueue.main) // Ensure the UI updates on the main thread.
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] in self?.image = $0 })
            // On successful completion, assign the received image to our published property.
    }

    // If for any reason we want to cancel an ongoing request, we can call this function.
    func cancel() {
        cancellable?.cancel()
    }
}
