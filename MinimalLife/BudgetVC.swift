//
//  BudgetVC.swift
//  MinimalLife
//
//  Created by Yosvani Lopez on 8/17/17.
//  Copyright © 2017 Yosvani Lopez. All rights reserved.
//

import UIKit

class BudgetVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TransactionsTable: UITableView!
    @IBOutlet weak var DaysCounterTable: UITableView!
    @IBOutlet weak var BudgetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
        }
    }
    
    /*********************************************************************/
    /*                      TableView Functions                      */
    /*********************************************************************/
    let transactions: [String] = ["111", "222", "333"]
    let dayCounter: [String] = ["111", "222", "333"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView.restorationIdentifier == "Transactions") {
            return transactions.count
        }
        else {
            return dayCounter.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if (tableView.restorationIdentifier == "Transactions") {
            cell.textLabel?.text = transactions[indexPath.row]
        }
        else {
            cell.textLabel?.text = dayCounter[indexPath.row]
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

