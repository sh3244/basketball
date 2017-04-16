//
//  GameCell.swift
//  Basketball Data
//
//  Created by Sam on 4/15/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import UIKit
import Stevia

class GameCell: UITableViewCell {
  var homeTeam: TeamScoreView!
  var awayTeam: TeamScoreView!
  var gameStatus: GameStatusView!

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    homeTeam = TeamScoreView()
    awayTeam = TeamScoreView()
    gameStatus = GameStatusView()

    contentView.sv([homeTeam, awayTeam, gameStatus])
    contentView.backgroundColor = .lightGray
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func layoutSubviews() {
    contentView.layout(
      0,
      |awayTeam, gameStatus, homeTeam| ~ 60,
      0
    )
  }

}
