//
//  NSCoding+HelpersTests.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 25/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import XCTest

import Foundation

class NSCodingHelpersTests: XCTestCase {

    func testCanArchiveAndUnarchiveNSCoding() {
        let note = Note(title: "secret", content: "i like turtles")
        let archivedData = note.archive()

        guard let note2 = Note.unarchive(archivedData) else {
            XCTAssert(false, "could not unarchive NSCoder")
            return
        }

        XCTAssertEqual(note.title, note2.title)
        XCTAssertEqual(note.content, note2.content)
    }

}
