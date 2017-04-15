//
//  Model.swift
//  Basketball Data
//
//  Created by Sam on 4/15/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

struct Team {
  var abbrev: String
  var city: String
  var full_name: String
  var id: Int
  var name: String
}

struct Player {
  var id: Int
  var name: String
  var team_id: Int
}

struct PlayerStat {
  var assists: Int
  var game_id: Int
  var id: Int
  var nerd: Int
  var player_id: Int
  var points: Int
  var rebounds: Int
  var team_id: Int
}

//extension GameState: Decodable {
//  static func decode(_ json: JSON) -> Decoded<GameState> {
//    return curry(GameState.init)
//      <^> json <| "assists"
//      <*> json <| "game_id"
//      <*> json <| "id"
//      <*> json <| "nerd"
//      <*> json <| "player_id"
//      <*> json <| "points"
//      <*> json <| "rebounds"
//      <*> json <| "team_id"
//  }
//}

struct Game {
  var away_team_id: Int
  var date: String
  var home_team_id: Int
  var id: Int
}

extension Game: Decodable {
  static func decode(_ json: JSON) -> Decoded<Game> {
    return curry(Game.init)
      <^> json <| "away_team_id"
      <*> json <| "date"
      <*> json <| "home_team_id"
      <*> json <| "id"
  }
}

struct GameState {
  var away_team_score: Int
  var broadcast: String
  var game_id: Int
  var game_status: String
  var home_team_score: Int
  var id: Int
  var quarter: Int
  var time_left_in_quarter: TimeInterval
}

extension GameState: Decodable {
  static func decode(_ json: JSON) -> Decoded<GameState> {
    return curry(GameState.init)
      <^> json <| "away_team_score"
      <*> json <| "broadcast"
      <*> json <| "game_id"
      <*> json <| "game_status"
      <*> json <| "home_team_score"
      <*> json <| "id"
      <*> json <| "quarter"
      <*> json <| "time_left_in_quarter"
  }
}

//extension User: Decodable {
//  static func decode(_ json: JSON) -> Decoded<User> {
//    return curry(User.init)
//      <^> json <| "id"
//      <*> json <| "name"
//      <*> json <|? "email" // Use ? for parsing optional values
//      <*> json <| "role" // Custom types that also conform to Decodable just work
//      <*> json <| ["company", "name"] // Parse nested objects
//      <*> json <|| "friends" // parse arrays of objects
//  }
//}
//
//// Wherever you receive JSON data:
//
//let json: Any? = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
//
//if let j: Any = json {
//  let user: User? = decode(j)
//}
