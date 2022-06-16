//
//  PizzaVC.swift
//  DevMnt Pro Del
//
//  Created by Ivan Ramirez on 1/19/22.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PlaceOrderProtocol {


    
   
    

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var myCollectionView: UICollectionView!

    private let pizzaData = PizzaData ()
    var orderCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }

    func addOrder() {
        orderCount += 1
        totalLabel.text = "\(orderCount)"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //how many pizzas
        pizzaData.pizzas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //identify the cell
        //in this case controlled by itemCVCell
        //we want cell to be recognized as part of ItemCVCell
        //return UICollectionViewCell returns a blank
        //cell is controlled by itemcvccell file, we are telling it to reference that file and it it doesn't work, return or exit blank cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pizzaCell", for: indexPath) as? ItemCVCell else { return UICollectionViewCell ()
        }
        //pizza object and has index associated to it
        let pizzaOptions = pizzaData.pizzas[indexPath.row]
        
        //we need to somehow pass the pizza option to our cell file
        cell.pizza = pizzaOptions
        return cell
    }
    
    

    // MARK: - Navigation

    //preparing for segue from main vc to detailMenuVC
    //accepting responsibilities
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//lets tell xcode where we want to go and chain all the variables together
        //unwrap and use comma
        guard let destinationVC = segue.destination as? DetailMenuVC,
                let cell = sender as? ItemCVCell,
              let indexPath = self.myCollectionView.indexPath(for: cell) else { return }
        
        let pizzaOptions = pizzaData.pizzas[indexPath.row]
        
        //we meed tp create a connection to our detail menu vc to pass the pizza option that was selected
        //call upon destinationVC and fill it with pizzaOption that will select it
        destinationVC.pizza = pizzaOptions
        
        //TODO - assign the protocol delegate to self
        //we need delegate to be self which is this file and now it knows to run this function
        destinationVC.pizzaDelegate = self
        
        
    }

    // MARK: - Animation
    func animateAstroDude(myImageView: UIImageView) {
        let originalCenter = myImageView.center
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, animations: {

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                myImageView.center.x -= 80.0
                myImageView.center.y += 10.0
            })

            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4) {
                myImageView.transform = CGAffineTransform(rotationAngle: -.pi / 80)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                myImageView.center.x -= 100.0
                myImageView.center.y += 50.0
                myImageView.alpha = 0.0
            }

            UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
                myImageView.transform = .identity
                myImageView.center = CGPoint(x:  900.0, y: 100.0)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 0.45) {
                myImageView.center = originalCenter
                myImageView.alpha = 1.0
            }

        //after character shakes?
        }, completion: { (_) in
            self.orderCount = 0
            self.totalLabel.text = "\(self.orderCount)"
        })
    }
    //when user places order, want to check if the order count is greater than zero, if not greater than zero want astrodude to shake
    //if the count is greater than zero, we want to astrodude to leave the screen and loop back in
    //we want the count to be greater than zero, if not do this
    func orderPlaced() {
        guard orderCount > 0 else {
            DispatchQueue.main.async {      //dispatchqueue gives priority bc it's user stuff
                self.logoImageView.shake()
            }
            return
        }
        //if the count is greater than zero then do this
        DispatchQueue.main.async {
            self.animateAstroDude(myImageView: self.logoImageView)
        }
    }
    

    // MARK: - Action
    @IBAction func orderButtonTapped(_ sender: Any) {
        orderPlaced()
    }

}
