//
//  ViewController.swift
//  Delegation
//
//  Created by TomerBu on 25/09/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

