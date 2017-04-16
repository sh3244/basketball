//
//  ViewController.swift
//  Basketball Data
//
//  Created by Sam on 4/15/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import UIKit
import Stevia

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var gameTableView: UITableView!
  var playerTableView: UITableView!
  var segmentControl: UISegmentedControl!

  var response: BallResponse = BallResponse(GameStates: [], Players: [], PlayerStats: [], Teams: [], Games: [])

  enum ViewType {
    case GameTable
    case PlayerTable
  }

  var viewType: ViewType = .GameTable

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    view.backgroundColor = .gray
    gameTableView = UITableView()
    gameTableView.backgroundColor = .black
    gameTableView.delegate = self
    gameTableView.dataSource = self
    gameTableView.register(GameCell.self, forCellReuseIdentifier: "gameCell")

    playerTableView = UITableView()
    playerTableView.delegate = self
    playerTableView.dataSource = self
    playerTableView.register(PlayerCell.self, forCellReuseIdentifier: "playerCell")
    segmentControl = UISegmentedControl()
    segmentControl.clipsToBounds = true
    segmentControl.insertSegment(withTitle: "Games", at: 0, animated: false)
    segmentControl.insertSegment(withTitle: "Stats", at: 1, animated: false)
    segmentControl.backgroundColor = .white
    segmentControl.tintColor = .red
    segmentControl.addTarget(self, action: #selector(segmentChangedFor), for: .valueChanged)

    view.sv([
      gameTableView,
      playerTableView,
      segmentControl
      ])

    update()
  }

  func segmentChangedFor(control: UISegmentedControl) {
    if control.selectedSegmentIndex == 0 {
      self.viewType = .GameTable
      playerTableView.removeFromSuperview()
      view.addSubview(gameTableView)
    }
    if control.selectedSegmentIndex == 1 {
      self.viewType = .PlayerTable
      gameTableView.removeFromSuperview()
      view.addSubview(playerTableView)
    }
  }

  func update() {
    response = DataManager.shared.fetchCatalogResponse()
    var tableView = gameTableView
    if self.viewType == .GameTable {
      tableView = gameTableView
    }
    else if self.viewType == .PlayerTable {
      tableView = playerTableView
    }
    tableView?.reloadData()
  }

  override func viewWillLayoutSubviews() {
    view.removeConstraints(view.constraints)
    if self.viewType == .GameTable {
      view.layout(
        20,
        |segmentControl| ~ 40,
        |gameTableView| ~ 80,
        0
      )
    }
    else if self.viewType == .PlayerTable {
      view.layout(
        20,
        |segmentControl| ~ 40,
        |playerTableView| ~ 80,
        0
      )
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    response = DataManager.shared.fetchCatalogResponse()
  }

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let index = indexPath.row

    let game = response.Games[index]

    if let gameCell = cell as? GameCell {
      gameCell.homeTeam.name.text = DataManager.shared.getTeamNameFrom(response: response, id: game.home_team_id)
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell")

    return cell ?? GameCell()
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if self.viewType == .GameTable {
      return response.Games.count
    }
    else if self.viewType == .PlayerTable {
      return response.Players.count
    }
    return 0
  }
}
