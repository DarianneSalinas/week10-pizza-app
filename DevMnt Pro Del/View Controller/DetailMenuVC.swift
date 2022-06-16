//
//  MenuVC.swift
//  DevMnt Pro Del
//
//  Created by Ivan Ramirez on 1/19/22.
//

import UIKit

//global thing
//creating set of instructions to be followed
protocol PlaceOrderProtocol: AnyObject{
    func addOrder()
//    func printReceipt()
//    func addTip()
//    func promoCode()
}

class DetailMenuVC: UIViewController{
    
    @IBOutlet weak var pizzaImageView: UIImageView!
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var calsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var cheeseLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!


    //landing pad to catch the pizza object from the main vc
    var pizza: Pizza?
    
    //create an instance of protocol
    weak var pizzaDelegate: PlaceOrderProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //updateViews function (updateViews can be named anything, this is just what we are calling it)
        updateViews()
        styleDismissButton()
    }

    func styleDismissButton() {
        //.normal is default state, while it's normal have this image
        //we have a button that we're giving an image to and setting its configuration, we gave it a system name using SF Symbols (x.circle.fill)
        dismissButton.setImage(UIImage(systemName: "x.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)), for: .normal)
        
        dismissButton.tintColor = .systemPink
        
        
    }
    
    
    func updateViews() {
        guard let pizza = pizza else { return }
        
        nameLabel.text = pizza.name
        prepTimeLabel.text = "⏰ 10 - 15 mins"
        cheeseLabel.text = pizza.cheeseType
        priceLabel.text = "$\(pizza.price)"
        calsLabel.text = "🔥 \(pizza.cal)"
        pizzaImageView.image = UIImage(named: pizza.imageName)
        ratingLabel.text = "⭐️ \(pizza.rating)"
        descriptionLabel.text = pizza.description
         
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
         //TODO: - When the button is tapped on VC #2, we want the count label in VC #1 to increment by 1
        pizzaDelegate?.addOrder()
        
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)        //this makes the modal go back down and dismisses
    }
    
}
