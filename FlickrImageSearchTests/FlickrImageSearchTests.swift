//
// FlickrImageSearchTests.swift
// Copyright (c) 2025. All rights reserved.
//

import XCTest
@testable import FlickrImageSearch

final class FlickrImageSearchTests: XCTestCase {
    func testFormattedDate() {
        // Given
        let isoDateString = "2025-02-06T15:53:48Z"

        // When
        // Then
        XCTAssertEqual(isoDateString.formattedDate(), "Feb 6, 2025")
    }

    func testFormattedDateFail() {
        // Given
        let failingIsoDateString = "2025-02-06"

        // When
        // Then
        XCTAssertNil(failingIsoDateString.formattedDate())
    }

    func testFindAuthor() {
        // Given
        let author = "nobody@flickr.com (\"author\")"

        // When
        // Then
        XCTAssertEqual(author.findAuthor(), "author")
    }

    func testFindAuthorFail() {
        // Given
        let failingAuthor = "author"

        // When
        // Then
        XCTAssertNil(failingAuthor.findAuthor())
    }

    func testFindWidthAndHeight() {
        // Given
        let htmlString = "width=\"240\" height=\"180\""

        // When
        // Then
        XCTAssertEqual(htmlString.findWidth(), "240")
        XCTAssertEqual(htmlString.findHeight(), "180")
    }

    func testFindWidthAndHeightFail() {
        // Given
        let htmlString = "width=240 height=180"


        // When
        // Then
        XCTAssertNil(htmlString.findWidth())
        XCTAssertNil(htmlString.findHeight())
    }
}
