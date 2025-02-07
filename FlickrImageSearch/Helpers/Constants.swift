//
// Constants.swift
// Copyright (c) 2025. All rights reserved.
//

struct Constants {
    static let dataURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="

    struct Main {
        static let filckrImage = "Flickr Images"
        static let searchingTags = "Searching tags:  "
    }

    struct Details {
        static let title = "Title"
        static let description = "Description"
        static let moreInformation = "More Information"
        static let author = "Author"
        static let publishedDate = "Published Date"
        static let imageWidth = "Image Width"
        static let imageHeight = "Image Height"
        static let imageDetails = "Image Details"
    }

    struct Errors {
        static let noResultFound = "No Results Found"
        static let sevicesDown = "There's something wrong with the services, please try again later."
        static let failFetchData = "Failed to fetch images: "
        static let dateNotValid = "Date not Valid"
    }

    struct Accessibility {
        static let searchingTags = "Searching tags"
        static let noResultFound = "No Results Found"
        static let sevicesIssues = "Service Issues"
        static let imageTitle = "Image Title"
        static let imageDescription = "Image Description"
        static let imageAuthor = "Image Author"
        static let imagePublishedDate = "Image Published Date"
        static let imageWidth = "Image Width"
        static let imageHeight = "Image Height"
    }
}
