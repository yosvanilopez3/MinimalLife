//
//  ImageCell.swift
//  MinimalLife
//
//  Created by Yosvani Lopez on 8/18/17.
//  Copyright © 2017 Yosvani Lopez. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    var image: UIImage!
    
    func configureCell(image: UIImage) {
        self.image = image
    }
}
