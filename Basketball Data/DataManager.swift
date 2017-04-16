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

  func getTeamForTeam(response: BallResponse, id: Int) -> Team? {
    let teams = response.Teams
    for team in teams {
      if team.id == id {
        return team
      }
    }
    return nil
  }

  func getStateForGame(response: BallResponse, id: Int) -> GameState? {
    let gameStates = response.GameStates
    for state in gameStates {
      if state.game_id == id {
        return state
      }
    }
    return nil
  }

  func getStatsForPlayer(response: BallResponse, id: Int) -> PlayerStat? {
    let stats = response.PlayerStats
    for stat in stats {
      if stat.player_id == id {
        return stat
      }
    }
    return nil
  }

  func periodStringFor(value: Int) -> String {
    switch value {
    case 1:
      return "Q1"
    case 2:
      return "Q2"
    case 3:
      return "Q3"
    case 4:
      return "Q4"
    default:
      return ""
    }
  }
}
