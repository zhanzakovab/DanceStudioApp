//
//  ViewController.swift
//  RollDice
//
//  Created by Zhanzakova Botakoz on 15.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    private var dices: [String] = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    private var rolls: [(first: Int, second: Int)] = [(Int, Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rollButton.layer.cornerRadius = 4
        rollButton.layer.masksToBounds = true
    }

    func updateRolls(){
        let randomNumber1 = Int(arc4random()) % 6
        let randomNumber2 = Int(arc4random()) % 6
        
        rolls.append((first: randomNumber1, second: randomNumber2))
        
        firstImageView.image = UIImage(named: dices[randomNumber1])
        secondImageView.image = UIImage(named: dices[randomNumber2])
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateRolls()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateRolls()
    }
    
    
    @IBAction func openRollsPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "RollsViewController") as? RollsViewController{
            vc.modalPresentationStyle = .fullScreen
            vc.rolls = rolls
            vc.callBack = { [weak self] roll in
                guard let self = self else {return}
                self.firstImageView.image = UIImage(named: self.dices[roll.first])
                self.secondImageView.image = UIImage(named: self.dices[roll.second])
            }
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
}

