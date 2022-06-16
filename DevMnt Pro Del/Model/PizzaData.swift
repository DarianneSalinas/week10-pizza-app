//
//  PizzaController.swift
//  DevMnt Pro Del
//
//  Created by Ivan Ramirez on 1/19/22.
//

import Foundation

struct PizzaData {

    var pizzas: [Pizza] {
        let babyPizza = Pizza(name: "Garden Pizza", cheeseType: "Mozzarella", price: 3.75, description: "One bite into our supreme pizza and you know this will be a moment to remember. Savor the mouthwatering taste of zesty tomato sauce, 100% real cheese and hearty toppings of tomatoes and fresh herbs  all piled on top of our Classic Crust that’s not too thick and not too thin with just the right amount of crunch. ", rating: 4.54, cal: 339, imageName: "babySlicePep")

        let pepperoniPizza = Pizza(name: "Pepperoni Pizza", cheeseType: "Mozzarella", price: 5.55, description: "One bite into our Stuffed Crust pepperoni pizza and you know this will be a moment to remember. You’ll savor the mouthwatering taste of zesty tomato sauce, real cheese and a hearty topping of pepperoni, all piled on top of our Stuffed Crust that’s loaded with rich, melty mozzarella cheese and has a unique, rectangle shape that brings a fun twist to pizza. ", rating: 4.1, cal: 801, imageName: "PepCheese")

        let meatballPizza = Pizza(name: "Meatball Pizza", cheeseType: "Mozzarella", price: 6.55, description: "Stop hunger in its tracks with this Rising Crust Meatball Pizza. This filling pizza can serve up to five people and features a mouthful of tasty toppings including tomato sauce, whole milk Mozzarella cheese, and meatballs.", rating: 4.7, cal: 714, imageName: "meatballPizza")

        let margheritaPizza = Pizza(name: "Margherita Pizza", cheeseType: "Mozzarella", price: 2.43, description: "Margherita  Pizza on a Thin Hand-Tossed Style Crust is created with extra virgin olive oil and a flavorful sauce made with vine-ripened tomatoes. This thin crust frozen pizza is topped with real mozzarella cheese, juicy tomatoes and basil on a thin, hand tossed style crust, delivering restaurant quality at home. ", rating: 4.1, cal: 539, imageName: "GardenPizza")

        return [meatballPizza, margheritaPizza, babyPizza, pepperoniPizza]
    }

}
