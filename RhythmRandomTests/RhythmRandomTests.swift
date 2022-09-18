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
    let barLength = 4
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RhythmApp()

    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testAppInit() throws {
        XCTAssertEqual(sut.firstBar.bar.count, barLength)
        XCTAssertEqual(sut.all4Bars.count, 4)
    }
    
    func testBarClass() throws {
        let barToBeTested = MusicalBar(bLength: 4, stem: .upHeadless)
        let staticBarArr = barToBeTested.bar
        XCTAssertTrue(barToBeTested.bar.count == 4)
        
        barToBeTested.rotateBar(.right)
        XCTAssertTrue(staticBarArr[2] == barToBeTested.bar[3])
        barToBeTested.rotateBar(.left)
        XCTAssertTrue(staticBarArr[2] == barToBeTested.bar[2])
        barToBeTested.rotateBar(.random)
        XCTAssertTrue(staticBarArr != barToBeTested.bar)
    }
    
}
