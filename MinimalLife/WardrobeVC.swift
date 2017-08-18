//
//  WardrobeVC.swift
//  MinimalLife
//
//  Created by Yosvani Lopez on 8/18/17.
//  Copyright © 2017 Yosvani Lopez. All rights reserved.
//

import UIKit

class WardrobeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var shirtCollection: UICollectionView!
    @IBOutlet weak var pantsCollection: UICollectionView!
    @IBOutlet weak var shoesCollection: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        shirtCollection.delegate = self
        shirtCollection.dataSource = self
        pantsCollection.delegate = self
        pantsCollection.dataSource = self
        shoesCollection.delegate = self
        shoesCollection.dataSource = self
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
        }
    }
    
/*********************************************************************/
/*                      Collection Functions                         */
/*********************************************************************/
    var shirts: [ArticleofClothing]  = []
    var pants: [ArticleofClothing] = []
    var shoes: [ArticleofClothing] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView.restorationIdentifier == "Shirts") {
            return shirts.count
        }
        else if (collectionView.restorationIdentifier == "Pants") {
            return pants.count
        }
        else {
            return shoes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ImageCell()
        if (collectionView.restorationIdentifier == "Shirts") {
            cell.configureCell(image: shirts[indexPath.row].image)
        }
        else if (collectionView.restorationIdentifier == "Pants") {
            cell.configureCell(image: pants[indexPath.row].image)
        }
        else {
            cell.configureCell(image: shoes[indexPath.row].image)
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
