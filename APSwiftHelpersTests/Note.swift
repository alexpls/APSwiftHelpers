//
//  Note.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 25/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import Foundation

class Note: NSObject, NSCoding {
    let title: String
    let content: String

    init(title: String, content: String) {
        self.title = title
        self.content = content
    }

    // MARK: - NSCoding

    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObjectForKey("title") as? String,
            let content = aDecoder.decodeObjectForKey("content") as? String else {
                return nil
        }

        self.init(title: title, content: content)
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(content, forKey: "content")
    }
}
