//
//  Basketball_Data_Tests.swift
//  Basketball Data Tests
//
//  Created by Sam on 4/15/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import XCTest

class Basketball_Data_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

  func testModels() {
    guard let path = Bundle.main.path(forResource: "basketballdata", ofType: "json") else {
      return
    }
    let file = FileManager()
    let contents = file.contents(atPath: path)

    guard let data = NSData(contentsOfFile: path) else {
      return
    }

    do {
      let result = try JSONSerialization.jsonObject(with: data, options: .prettyPrinted) as? NSDictionary {
        let gameState: GameState = decode(result)

      }
    } catch {
      print("fuck")
    }
    
  }

//  if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//    if let data = NSData(contentsOf: url) {
//      do {
//        let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
//
//        return dictionary
//      } catch {
//        print("Error!! Unable to parse  \(fileName).json")
//      }
//    }
//    print("Error!! Unable to load  \(fileName).json")
//  }
}
