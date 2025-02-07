//
// ImageSearchMainViewModel.swift
// Copyright (c) 2025. All rights reserved.
//

import SwiftUI
import Combine

final class ImageSearchViewModel: ObservableObject {
    // make observable property to parse data after changed
    @Published var images: [ImageDataModel]? = []

    private var dataURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    private var cancellable: AnyCancellable?

    // Add deinit func to stop unnecessary observations and prevent memory leaks
    deinit {
        cancellable?.cancel()
    }

    // Add function to cancel the task if need
    func cancel() {
        cancellable?.cancel()
    }

    // This function will be called every time the search keyword change
    func getImageData(from tag: String) {
        // Empty the images when user remove the search key
        if tag.isEmpty {
            images = []
            return
        }

        // Optional Binding for safely using url
        guard let url = URL(string: dataURL + tag) else { return }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            // Only pass data part from result
            .map { $0.data }
            .decode(type: ImageSearchResponse.self, decoder: JSONDecoder())
            // Work on main queue since the fetched data will be used to update the UI
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    // Display error message with user
                    self?.images = nil
                    // Find error in debug console if failed to fetch the data
                    debugPrint("Failed to fetch images: " + "\(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.images = self?.transformData(response: response)
            })
    }

    private func transformData(response: ImageSearchResponse) -> [ImageDataModel] {
        var images = [ImageDataModel]()

        if let imageItems = response.items {
            images = imageItems.map {
                ImageDataModel(imageURL: $0.media?.values.first ?? "",
                               imageDetails: ImageDataModel.ImageDetails(imageURL: $0.media?.values.first ?? "",
                                                                         title: $0.title,
                                                                         description: $0.description,
                                                                         author: $0.author,
                                                                         date: $0.published))
            }
        }
        return images
    }
}
