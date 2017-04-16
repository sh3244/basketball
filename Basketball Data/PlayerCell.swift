//
//  PlayerCell.swift
//  Basketball Data
//
//  Created by Sam on 4/15/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import UIKit
import Stevia

class PlayerCell: UITableViewCell {
  var name: UILabel!
  var team: UILabel!
  var stats: UILabel!
  var nerd: UILabel!
  var nerdLabel: UILabel!

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    name = UILabel()
    name.textAlignment = .left

    team = UILabel()

    stats = UILabel()
    stats.textAlignment = .left

    nerd = UILabel()
    nerd.textAlignment = .center

    nerdLabel = UILabel()
    nerdLabel.textAlignment = .center
    nerdLabel.text = "nERD"

    contentView.backgroundColor = .lightGray
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    sv([name, stats, nerd, nerdLabel])
    nerd.width(80)
    nerdLabel.width(80)
    layout(
      0,
      |name-nerdLabel| ~ 30,
      |stats-nerd| ~ 30,
      0
    )
  }

}
