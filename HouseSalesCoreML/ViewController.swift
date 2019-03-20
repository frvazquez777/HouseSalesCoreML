//
//  ViewController.swift
//  HouseSalesCoreML
//
//  Created by Fredy Roman Vazquez Geronio on 3/20/19.
//  Copyright © 2019 Fredy Roman Vazquez Geronimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var costOfOwnership: UILabel!

    @IBOutlet weak var numberRoom: UILabel!
    @IBOutlet weak var numberBathrom: UILabel!
    @IBOutlet weak var squareFeet: UILabel!

    @IBOutlet weak var sliderRoom: UISlider!
    @IBOutlet weak var sliderBathroom: UISlider!
    @IBOutlet weak var sliderSquareFeet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // predictPrice(bathrom: 2, romm: 4, squereFeet: 1200)
    }

    func predictPrice(bathrom: Double, room: Double, squereFeet: Double) -> Double {
        let houseSales = HouseSalesInCA()
        guard let price = try? houseSales.prediction(Bedrooms: room, Bathrooms: bathrom, Size: squereFeet)
            else {
                print("A ocurrido un error")
            return 0.0
            }
        print(price.Price)
        return price.Price
    }

    //actions slider
    @IBAction func changesValuesProperty(_ sender: Any) {
        print("Value Room: \(sliderRoom.value)")
        print("Value BathRoom: \(sliderBathroom.value)")
        print("Value Square Feet: \(sliderSquareFeet.value) \n")
        
        let roomInt = Int(sliderRoom.value)
        let bathroomInt = Int(sliderBathroom.value)
        let squareFeetInt = Int(sliderSquareFeet.value)
        
        let priceHouse = predictPrice(bathrom: Double(bathroomInt), room: Double(roomInt), squereFeet: Double(squareFeetInt))

        costOfOwnership.text = "Cost of ownership is $\(Int(priceHouse))"
        numberRoom.text = "Number Room: \(roomInt)"
        numberBathrom.text = "Number Bathroom: \(bathroomInt)"
        squareFeet.text = "Square Feet: \(squareFeetInt)"
    }
    
}

