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

  var isFinal: Bool = true

  override init(frame: CGRect) {
    time = UILabel()
    time.textAlignment = .center
    final = UILabel()
    final.textAlignment = .center
    final.text = "FINAL"
    broadcaster = UILabel()
    broadcaster.textAlignment = .center
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    time = UILabel()
    final = UILabel()
    broadcaster = UILabel()

    super.init(coder: aDecoder)
  }

  override func layoutSubviews() {
    removeConstraints(constraints)
    if isFinal {
      sv(final)
      layout(
        0,
        |final| ~ 60,
        0
      )
      backgroundColor = .green
    }
    else {
      sv([time, broadcaster])
      layout(
        0,
        |time| ~ 30,
        |broadcaster| ~ 30,
        0
      )
      backgroundColor = .red
    }
  }

  func prepareForReuse() {
    time.removeFromSuperview()
    final.removeFromSuperview()
    broadcaster.removeFromSuperview()
  }
}
