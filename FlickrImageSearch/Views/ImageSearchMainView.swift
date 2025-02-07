//
// ImageSearchMainView.swift
// Copyright (c) 2025. All rights reserved.
//

import SwiftUI

struct ImageSearchMainView: View {
    // Creat observable properties
    @StateObject private var viewModel = ImageSearchViewModel()
    @State private var searchText = ""

    // Setup three columns for the grid view
    private let gridItems = [GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible())]

    var body: some View {
        // Make navigation flow
        NavigationStack {
            Text(Constants.Main.searchingTags + searchText)
                .onChange(of: searchText) { _, newValue in
                    // Cancel the previous parsing data process when search key changed
                    viewModel.cancel()
                    viewModel.getImageData(from: newValue)
                }
                .navigationTitle(Constants.Main.filckrImage)

            // Optional binding to safely display images
            if let images = viewModel.images {
                // Make screen scrollable
                ScrollView {
                    // Inform user no results found
                    if images.isEmpty && !searchText.isEmpty {
                        Text(Constants.Errors.noResultFound)
                            .bold()
                            .padding()
                    }
                    // Add grid view to display images
                    LazyVGrid(columns: gridItems) {
                        ForEach(images, id: \.self) { imageData in
                            // Add navigation to the images
                            NavigationLink(destination: ImageDetailsView(detailsModel: imageData.imageDetails)) {
                                // Dislay image, use AsyncImage to cache the image temporarily
                                AsyncImage(url: URL(string: imageData.imageURL)) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    // Add progress indicator
                                    ProgressView()
                                }
                            }
                        }
                        .padding()
                    }
                }
            } else {
                // Display error information when services are down
                Text(Constants.Errors.sevicesDown)
                    .bold()
                    .padding()
            }
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ImageSearchMainView()
}
