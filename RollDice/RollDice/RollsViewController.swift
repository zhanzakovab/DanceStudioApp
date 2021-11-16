//
//  RollsViewController.swift
//  RollDice
//
//  Created by Zhanzakova Botakoz on 15.04.2021.
//

import UIKit

class RollsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    
    public var callBack: (((first: Int, second: Int)) -> (Void))?
    
    public var rolls: [(first: Int, second: Int)] = [(Int, Int)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: RollCell.identifier, bundle: Bundle(for: RollCell.self)), forCellReuseIdentifier: RollCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if rolls.count != 0 {
            tableView.reloadData()
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let roll = rolls[indexPath.row]
        callBack?(roll)
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rolls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RollCell.identifier, for: indexPath) as! RollCell
        let first = rolls[indexPath.row].first
        let second = rolls[indexPath.row].second
        let roll = (first:first + 1, second:second + 1)
        cell.roll = roll
        return cell
    }
    


}
