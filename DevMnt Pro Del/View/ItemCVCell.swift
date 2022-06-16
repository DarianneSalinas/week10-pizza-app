//
//  ItemVCell.swift
//  DevMnt Pro Del
//
//  Created by Ivan Ramirez on 1/19/22.
//

import UIKit

class ItemCVCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var cheeseLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    
    //create landing pad or catcher person that's going to catch the ball
    //itemcvcell has a variable called pizza that will catch a pizza but it might not so optional
    var pizza: Pizza? {
        
        //property observer
            didSet {
        updateViews()
    }
}
    func updateViews () {
        guard let pizza = pizza else { return }
        
        nameLabel.text = pizza.name
        cheeseLabel.text = pizza.cheeseType
        priceLabel.text = "$\(pizza.price)"
        pizzaImage.image = UIImage(named: pizza.imageName)
    }
}
