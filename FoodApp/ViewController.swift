//
//  ViewController.swift
//  FoodApp
//
//  Created by Jemi on 14/11/2021.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    
    var foodArray = Array<FoodItem>()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label.text = foodArray[indexPath.row].name
        cell.image.image = UIImage(named: foodArray[indexPath.row].image!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetails", sender: foodArray[indexPath.row ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dis = segue.destination as? ViewController2 {
            if let foodItem = sender as? FoodItem {
                dis.foodItem = foodItem
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        readFromPList()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func readFromPList() {
        let path = Bundle.main.path(forResource: "Foods", ofType: "plist")
        let url = URL(fileURLWithPath: path!)
        let data = try! Data(contentsOf: url)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        let dicArray = plist as! [[String:String]]
        for dic in dicArray {
            foodArray.append(FoodItem(name: dic["Name"]!, image: dic["Image"]!, desc: dic["Des"]!))
        }
    }


}

