//
//  GameStatusView.swift
//  Basketball Data
//
//  Created by Huang, Samuel on 4/16/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import UIKit
import Stevia

class GameStatusView: UIView {
  var broadcaster: UILabel!

  var time: UILabel!
  var final: UILabel!

  override init(frame: CGRect) {
    time = UILabel()
    time.textAlignment = .center
    final = UILabel()
    final.textAlignment = .center
    broadcaster = UILabel()
    broadcaster.textAlignment = .center
    super.init(frame: frame)

    sv([time, final, broadcaster])
  }

  required init?(coder aDecoder: NSCoder) {
    time = UILabel()
    final = UILabel()
    broadcaster = UILabel()

    super.init(coder: aDecoder)
  }

  override func layoutSubviews() {
    layout(
      0,
      |time| ~ 30,
      |broadcaster| ~ 30,
      0
    )
  }

}
