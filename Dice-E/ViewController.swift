//
//  ViewController.swift
//  Dice-E
//
//  Created by Parth Parikh on 19/12/18.
//  Copyright © 2018 Parth Parikh. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

class ViewController: UIViewController {

    @IBOutlet weak var leftDiceImage: UIImageView!
    @IBOutlet weak var rightDiceImage: UIImageView!
    
    var randomDiceIndexLeft : Int = 0
    var randomDiceIndexRight : Int = 0
    
    let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlert()
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        //This will get executed when the roll button is pressed
        updateDiceImages() //Function call
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
        
    }
    
    func updateDiceImages() {
        randomDiceIndexLeft = Int.random(in: 0 ... 5)
        randomDiceIndexRight = Int.random(in: 0 ... 5)
        
        leftDiceImage.image = UIImage(named: diceArray[randomDiceIndexLeft])
        rightDiceImage.image = UIImage(named: diceArray[randomDiceIndexRight])
        
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
    }
    
    func showAlert()
    {
        let alert = UIAlertController(title: "Welcome to Las Vegas Dice", message: "SHAKE the device or TAP the 'ROLL' button", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

