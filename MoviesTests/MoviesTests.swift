//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Rob Gilbert on 8/3/17.
//  Copyright © 2017 Rob Gilbert. All rights reserved.
//

import XCTest
@testable import Movies

class MoviesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let fm = FileManager.default
        do {
            let attr = try fm.attributesOfItem(atPath: "/etc/newsyslog.conf")
            let x = attr[FileAttributeKey.modificationDate] as! Date
            print("Modification Date: \(attr[FileAttributeKey.modificationDate] ?? "Hello")")
        } catch {
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
