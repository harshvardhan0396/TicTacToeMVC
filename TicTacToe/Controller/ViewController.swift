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
    var player = 1
    
    @IBAction func restartButton(_ sender: UIButton) {
    }
    @IBAction func buttonPressed(_ sender: UIButton){
        if(player == 1 ){
            sender.setBackgroundImage(UIImage(named: "TTTO"), for: UIControl.State.normal)
            player = 2
        }
        else {
            sender.setBackgroundImage(UIImage(named: "TTTX"), for: UIControl.State.normal)
            player = 1
        }
    }
}
