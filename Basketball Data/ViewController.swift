//
//  ViewController.swift
//  Basketball Data
//
//  Created by Sam on 4/15/17.
//  Copyright © 2017 Basket. All rights reserved.
//

import UIKit
import Stevia

class ViewController: UIViewController {
  var gameTableView: UITableView!
  var playerTableView: UITableView!
  var segmentControl: UISegmentedControl!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    view.backgroundColor = UIColor.gray
    gameTableView = UITableView()
    playerTableView = UITableView()
    segmentControl = UISegmentedControl()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    view.sv([
      gameTableView,
      playerTableView,
      segmentControl
      ])
    view.layout(
      segmentControl ~ 80,
      gameTableView ~ 80,
      playerTableView ~ 80
    )
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
