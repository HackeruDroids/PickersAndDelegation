//
//  ViewController.swift
//  Delegation
//
//  Created by TomerBu on 25/09/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var cityPicker: UIPickerView!{
        //property observer:
        didSet{
            //may conform using the story board.
            //cityPicker.dataSource = self
            //cityPicker.delegate = self
        }
    }
    
//    let cities = ["Tel-Aviv", "Arad", "Holon"]
//    
//    let countries = ["Israel", "US"] //dict.keys
//    let arrOfArrays = [["Tel-Aviv", "Arad", "Holon"], ["Chicago"]] //dict.values
//    
//    
//    //dictionaries are un-ordered! dict.values. dict.keys
   // let dict = ["Israel": ["Tel-Aviv", "Arad", "Holon"],
//                "US": ["Chicago"]]
    
    
    
    
 
 
    
    @IBAction func didPickDate(_ sender: UIDatePicker) {
        let date:Date = sender.date
        
        let formatter = DateFormatter()
        
        formatter.dateStyle = DateFormatter.Style.short
        
        
        let short = formatter.string(from: date)
        print("Short: ", short)
        
        formatter.dateStyle = .medium
        let medium = formatter.string(from: date)
        print("medium: ", medium)
        
        formatter.dateStyle = .long
        let long = formatter.string(from: date)
        print("long: ", long)
        
        
        formatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        let custom = formatter.string(from: date)
        
        dateLabel.text = custom
        
        //seconds since 1970! not millis
        let epoch: Double = date.timeIntervalSince1970 * 1000
        
        
        let today = Date(timeIntervalSince1970: epoch / 1000)
    }
    @IBOutlet weak var dateLabel: UILabel!
   
    
    var tupleArray: [(country: String , countryCode: String)] = []
    
    //onCreate in android
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tupleArray.append(("Israel","ILS"))
        tupleArray.append(("USA",  "USD"))
        tupleArray.append(("Jordan",  "JDR"))
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tupleArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return tupleArray[row].country
        }else if component == 1{
            return tupleArray[row].countryCode
        }
        //no such component
        fatalError("No Such component")
    }
}

