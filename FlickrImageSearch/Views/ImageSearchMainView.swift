//
// ImageSearchMainView.swift
// Copyright (c) 2025. All rights reserved.
//

import SwiftUI

struct ImageSearchMainView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            Text("Searching: \(searchText)")
                .navigationTitle("Flickr")
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ImageSearchMainView()
}
