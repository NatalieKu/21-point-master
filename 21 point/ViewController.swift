//
//  ViewController.swift
//  21 point
//
//  Created by MEI KU on 2017/7/5.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var totalpointLabel: UILabel!
    
    @IBOutlet weak var bg: UIImageView!
    
    
    
    var lightOn = true
    var cardNum = [0,1,2,3,4,5,6,7,8,9,10,11,12,13]
    var point = 0
    var index = 0
    var sum = 0
    var value = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    func updateUI() {
        index = Int(arc4random_uniform(UInt32(cardNum.count)))
        bg.image = UIImage(named:"\(index)")
        totalpointLabel.isHidden = false
        
        
        
    }
        
    
    
    @IBAction func BTN(_ sender: AnyObject) {
        sum = sum + index
        totalpointLabel.text = "point: \(sum)"
            
            if sum == 21 {
                let alertController = UIAlertController(
                    title: "Balckjack!",
                    message: "Welcome to Neverland!",
                    preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Play again",
                                             style: .default,
                                             handler:{
                                                (action: UIAlertAction!) -> Void in
                                                self.initialize()
                                                self.updateUI()
                                                self.totalpointLabel.isHidden = true
                })
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
            
            if sum > 21 {
                let alertController = UIAlertController(
                    title: "You lose the game!",
                    message: "Captain Hook takes all money!",
                    preferredStyle: .alert)
                
                
                let okAction = UIAlertAction(title: "Play again",
                                             style: .default,
                                             handler:{
                                                (action: UIAlertAction!) -> Void in
                                                self.initialize()
                                                self.updateUI()
                                                self.totalpointLabel.isHidden = true
                                                
                })
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            }
                
        
            else {
                updateUI()
            }
        }
    
    
    func initialize()
    {
        cardNum = [0,1,2,3,4,5,6,7,8,9,10,11,12,13]
        sum = 0
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



