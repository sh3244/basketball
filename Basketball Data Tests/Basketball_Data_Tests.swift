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

//  func testModels() {
//    guard let path = Bundle.main.path(forResource: "basketballdata", ofType: "json") else {
//      return
//    }
//    let file = FileManager()
//    let _ = file.contents(atPath: path)
//
//    guard let data = NSData(contentsOfFile: path) else {
//      return
//    }
//    do {
//      if let results = try JSONSerialization.jsonObject(with: data as Data, options: []) as? NSDictionary {
//
//        let gameStates: [GameState] = decode(results["Game State"]!)!
//        let players: [Player] = decode(results["Players"]!)!
//        let playerStats: [PlayerStat] = decode(results["Player Stats"]!)!
//        let teams: [Team] = decode(results["Teams"]!)!
//        let games: [Game] = decode(results["Games"]!)!
//
//        print(gameStates, players, playerStats, teams, games)
//      }
//
//    } catch {
//      
//    }
//    
//  }

  func testDataManager() {
    let manager = DataManager.shared
  }
  
}
