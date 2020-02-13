//
//  ViewController.swift
//  TicTacToe
//
//  Created by Harshvardhan on 13/02/20.
//  Copyright © 2020 Harshvardhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var a = 0
    
    @IBAction func restartButton(_ sender: UIButton) {
        var a = 1
        var b = 0
        sender.setBackgroundImage(UIImage(named: "TTTO"), for: UIControl.State.normal)

    }
//    @IBAction func buttonPressed(_ sender: UIButton) {
//        sender.setBackgroundImage(UIImage(named: "TTTO"), for: UIControl.State.normal)
//}
}
