//
//  PlayerCell.swift
//  Basketball Data
//
//  Created by Sam on 4/15/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
  var name: UILabel!
  var team: UILabel!
  var stats: UILabel!
  var nerd: UILabel!
  var nerdLabel: UILabel!

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    name = UILabel()
    team = UILabel()
    stats = UILabel()
    nerd = UILabel()
    nerdLabel = UILabel()
    contentView.backgroundColor = .lightGray
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

}
