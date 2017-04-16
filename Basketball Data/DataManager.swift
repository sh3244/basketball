//
//  DataManager.swift
//  Basketball Data
//
//  Created by Sam on 4/15/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import UIKit
import Argo

class DataManager: NSObject {
  var response: BallResponse = BallResponse(GameStates: [], Players: [], PlayerStats: [], Teams: [], Games: [])

  static let shared: DataManager = {
    let instance = DataManager()

    return instance
  }()

  func fetchCatalogResponse() -> BallResponse {
    let empty = BallResponse(GameStates: [], Players: [], PlayerStats: [], Teams: [], Games: [])

    guard let path = Bundle.main.path(forResource: "basketballdata", ofType: "json") else {
      return empty
    }

    guard let data = NSData(contentsOfFile: path) else {
      return empty
    }
    do {
      if let results = try JSONSerialization.jsonObject(with: data as Data, options: []) as? NSDictionary {
        let gameStates: [GameState] = decode(results["Game State"]!)!
        let players: [Player] = decode(results["Players"]!)!
        let playerStats: [PlayerStat] = decode(results["Player Stats"]!)!
        let teams: [Team] = decode(results["Teams"]!)!
        let games: [Game] = decode(results["Games"]!)!

        let response = BallResponse(GameStates: gameStates, Players: players, PlayerStats: playerStats, Teams: teams, Games: games)
        return response
      }

    } catch {
      
    }
    return empty
  }

  func updateCatalogResponse() {
    response = fetchCatalogResponse()
  }

  func teamNameFrom(id: String) -> String {
    let teams = response.Teams
    for team in teams {
      if team.id == id {
        return team.full_name
      }
    }
  }
}
