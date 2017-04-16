//
//  TeamScoreView.swift
//  Basketball Data
//
//  Created by Huang, Samuel on 4/16/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import UIKit
import Stevia

class TeamScoreView: UIView {
  let name: UILabel!
  let score: UILabel!
  
  override init(frame: CGRect) {
    name = UILabel()
    name.textAlignment = .center
    score = UILabel()
    score.textAlignment = .center

    super.init(frame: frame)

    sv([name, score])
  }
  
  required init?(coder aDecoder: NSCoder) {
    name = UILabel()
    score = UILabel()
    super.init(coder: aDecoder)
  }

  override func layoutSubviews() {
    layout(
      0,
      |name| ~ 30,
      |score| ~ 30,
      0
    )
  }

}
