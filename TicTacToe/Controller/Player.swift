//
//  Player.swift
//  TicTacToe
//
//  Created by Harshvardhan on 04/03/20.
//  Copyright © 2020 Harshvardhan. All rights reserved.
//

import UIKit

class Player: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let alertController = UIAlertController(title: "TicTacToe", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name"
        }
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Room"
        }
        let firstTextField = alertController.textFields![0] as UITextField
        let secondTextField = alertController.textFields![1] as UITextField
        
        alertController.addAction(UIAlertAction(title: "Join Room", style: UIAlertAction.Style.default, handler: { _ in
           
        }))
        alertController.addAction(UIAlertAction(title: "Create Room", style: UIAlertAction.Style.default, handler: { _ in
            
            
        }))
        
        
        
        self.present(alertController, animated: true, completion: nil)
    
    }

}
