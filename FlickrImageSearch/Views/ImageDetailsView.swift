//
// ImageDetailsView.swift
// Copyright (c) 2025. All rights reserved.
//

import SwiftUI

struct ImageDetailsView: View {
    let detailsModel: ImageDataModel.ImageDetails

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // Display Image
                    AsyncImage(url: URL(string: detailsModel.imageURL)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }

                    // Display the title of the image if have
                    if let title = detailsModel.title {
                        Spacer(minLength: 16.0)

                        HStack {
                            Text(Constants.Details.title)
                                .fontWeight(.bold)
                                .frame(width: 150, alignment: .leading)
                            Text(title)
                                .accessibilityLabel(title)
                        }
                    }

                    // Display the information link of the image if have
                    if let description = detailsModel.description {
                        Spacer(minLength: 16.0)

                        HStack {
                            Text(Constants.Details.description)
                                .fontWeight(.bold)
                                .frame(width: 150, alignment: .leading)
                            NavigationLink(destination: ImageWebView(htmlContent: description)) {
                                Text(Constants.Details.moreInformation)
                            }

                        }
                    }

                    // Display the author of the image if have
                    if let author = detailsModel.author {
                        Spacer(minLength: 16.0)

                        HStack {
                            Text(Constants.Details.author)
                                .fontWeight(.bold)
                                .frame(width: 150, alignment: .leading)
                            Text(author)
                                .accessibilityLabel(author)
                        }
                    }

                    // Display the published data of the image if have
                    if let date = detailsModel.date {
                        Spacer(minLength: 16.0)

                        HStack {
                            Text(Constants.Details.publishedDate)
                                .fontWeight(.bold)
                                .frame(width: 150, alignment: .leading)
                            Text(date)
                                .accessibilityLabel(date)
                        }
                    }
                }
                .padding()
                .navigationTitle(Constants.Details.imageDetails)
            }
        }
    }
}

