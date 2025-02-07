//
// HelperMethods.swift
// Copyright (c) 2025. All rights reserved.
//

import Foundation

extension String {
    /// Transform from iso format to more readable format MMM, D, YYYY
    func formattedDate() -> String? {
        let isoFormatter = ISO8601DateFormatter()

        // Check if date is valid
        if let date = isoFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }

        return nil
    }

    /// Find author name from input string
    /// Author input standard: "nobody@flickr.com ("author")"
    func findAuthor() -> String? {
        // (?<=\(\") means positive lookbehind to match content only after ("
        // [^\"]+    means matching one or more characters that are not "
        // (?=\"\))  means positive lookahead to ensure the content is followed by ")
        if let match = self.range(of: #"(?<=\(\")[^\"]+(?=\"\))"#, options: .regularExpression) {
            let result = String(self[match])
            return result
        }
        return nil
    }
}
