//
//  RhythmRandomTests.swift
//  RhythmRandomTests
//
//  Created by Merlin Jones on 07/09/2022.
//

import XCTest
@testable import RhythmRandom

class RhythmRandomTests: XCTestCase {
    var sut : RhythmApp!
    let exampleData = ["a","b","c","d", "e", "f", "g"] // 7 items long
    let barLength = 4
    let setBarForTest = [
        RhythmRandom.RhythmApp.Rhythm(name: "a", id: 1, value: 0.625),
        RhythmRandom.RhythmApp.Rhythm(name: "b", id: 2, value: 0.75),
        RhythmRandom.RhythmApp.Rhythm(name: "c", id: 3, value: 0.375),
        RhythmRandom.RhythmApp.Rhythm(name: "d", id: 4, value: 0.875)
    ]
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RhythmApp(allRhytyms: exampleData, barLength: barLength)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testAppInit() throws {
        XCTAssertEqual(sut.bar.count, barLength)
        XCTAssertEqual(sut.rhythms.count, exampleData.count)
    }
    
    func testRotation() throws {
        sut.setTestVals()
        // or store randomized and then rotate and reference the stored value to compare against. <- better practice. 
        sut.rotateModelBar(.right)
        XCTAssertTrue(setBarForTest[0].name == sut.bar[1].name)
        XCTAssertTrue(setBarForTest[1].name == sut.bar[2].name)

        sut.rotateModelBar(.left)
        XCTAssertTrue(setBarForTest[0].name == sut.bar[0].name)
        XCTAssertTrue(setBarForTest[1].name == sut.bar[1].name)

    }
    
}
