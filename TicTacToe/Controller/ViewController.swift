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
    var count = 0
    @IBAction func restartButton(_ sender: UIButton) {
        button00.setBackgroundImage(nil, for: UIControl.State.normal)
        button01.setBackgroundImage(nil, for: UIControl.State.normal)
        button02.setBackgroundImage(nil, for: UIControl.State.normal)
        button10.setBackgroundImage(nil, for: UIControl.State.normal)
        button11.setBackgroundImage(nil, for: UIControl.State.normal)
        button12.setBackgroundImage(nil, for: UIControl.State.normal)
        button20.setBackgroundImage(nil, for: UIControl.State.normal)
        button21.setBackgroundImage(nil, for: UIControl.State.normal)
        button22.setBackgroundImage(nil, for: UIControl.State.normal)
        button00.isEnabled = true
        button01.isEnabled = true
        button02.isEnabled = true
        button10.isEnabled = true
        button11.isEnabled = true
        button12.isEnabled = true
        button20.isEnabled = true
        button21.isEnabled = true
        button22.isEnabled = true
    }
    
    @IBAction func buttonPressed(_ sender: UIButton){
        if(player == 1 ){
            sender.setBackgroundImage(UIImage(named: "TTTO"), for: UIControl.State.normal)
            player = 2
            sender.isEnabled = false
            count += 1
        }
        else {
            sender.setBackgroundImage(UIImage(named: "TTTX"), for: UIControl.State.normal)
            player = 1
            sender.isEnabled = false
            count += 1
        }
    print (count)
    }
}
