//
//  ViewController2.swift
//  FoodApp
//
//  Created by Jemi on 14/11/2021.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UITextView!
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var foodItem:FoodItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(foodItem != nil){
            image.image =  UIImage(named: foodItem!.image!)
            name.text = foodItem!.name!
            desc.text = foodItem!.desc!
        }
    }

}
