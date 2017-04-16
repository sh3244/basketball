//
//  GameCell.swift
//  Basketball Data
//
//  Created by Sam on 4/15/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
  var homeTeamName: UILabel!
  var homeTeamScore: UILabel!

  var awayTeamName: UILabel!
  var awayTeamScore: UILabel!

  var broadcaster: UILabel!

  var time: UILabel!
  var final: UILabel!

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    homeTeamName = UILabel()
    homeTeamScore = UILabel()

    awayTeamName = UILabel()
    awayTeamScore = UILabel()

    broadcaster = UILabel()

    time = UILabel()
    final = UILabel()
    contentView.backgroundColor = .lightGray
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }


}
