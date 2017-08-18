//
//  MealVC.swift
//  MinimalLife
//
//  Created by Yosvani Lopez on 8/17/17.
//  Copyright © 2017 Yosvani Lopez. All rights reserved.
//

import UIKit

class MealVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var IngredientsTable: UITableView!
    @IBOutlet weak var InstructionsTable: UITableView!
    @IBOutlet weak var notesTable: UITableView!
    @IBOutlet weak var dateandMealLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IngredientsTable.delegate = self
        IngredientsTable.dataSource = self
        InstructionsTable.delegate = self
        InstructionsTable.dataSource = self
        notesTable.delegate = self
        notesTable.dataSource = self
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }

/*********************************************************************/
/*                      TableView Functions                      */
/*********************************************************************/
    var Ingredients: [String] = ["111", "222", "333"]
    var Instructions: [String] = ["111", "222", "333"]
    var Notes: [String] = ["111", "222", "333"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView.restorationIdentifier == "Ingredients") {
            return Ingredients.count
        }
        else if (tableView.restorationIdentifier == "Instructions") {
            return Instructions.count
        }
        else {
            return Notes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if (tableView.restorationIdentifier == "Ingredients") {
            cell.textLabel?.text = Ingredients[indexPath.row]
        }
        else if (tableView.restorationIdentifier == "Instructions") {
            cell.textLabel?.text = Instructions[indexPath.row]
        }
        else {
            cell.textLabel?.text = Notes[indexPath.row]
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

