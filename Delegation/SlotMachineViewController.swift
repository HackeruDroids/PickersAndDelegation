//
//  SlotMachineViewController.swift
//  Delegation
//
//  Created by TomerBu on 25/09/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit

class SlotMachineViewController: UIViewController {

    var images: [UIImage] = [
        #imageLiteral(resourceName: "icons8-win"), #imageLiteral(resourceName: "icons8-7_c"), #imageLiteral(resourceName: "icons8-plum"), #imageLiteral(resourceName: "icons8-pear"), #imageLiteral(resourceName: "icons8-berry"), #imageLiteral(resourceName: "icons8-apple"), #imageLiteral(resourceName: "icons8-grapes"), #imageLiteral(resourceName: "icons8-banana"), #imageLiteral(resourceName: "icons8-citrus"), #imageLiteral(resourceName: "icons8-cherry"), #imageLiteral(resourceName: "icons8-orange")]
    
    
    @IBAction func spin(_ sender: UIButton) {
        slotMachine.selectRow(30, inComponent: 0, animated: true)
        slotMachine.selectRow(44, inComponent: 1, animated: true)
        slotMachine.selectRow(61, inComponent: 2, animated: true)
    }
    @IBOutlet weak var slotMachine: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var name = "Moshe"
        print(name.length())
        //name.characters.count
        // Do any additional setup after loading the view.
        
        slotMachine.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


//conform to the uipickerview delegates in a s
extension SlotMachineViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count * 10
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //reuse:
        if let imageView = view as? UIImageView{
            imageView.image = images[row % images.count]
            return imageView
        }
        
        //create a new UIImageView
        return UIImageView(image: images[row % images.count])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return #imageLiteral(resourceName: "icons8-orange").size.height
    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "☄️"
//    }
    
    
}



//example for extending an existing struct

//"moshe".length()
extension String{
    func length()->Int{
        return self.characters.count
    }
}

//Int.nextInt()
extension Int{
    static func nextInt(max: Int)->Int{
        return Int(arc4random_uniform(UInt32(max)))
    }
}

extension Double{
    static func nextInt(max: Int)->Double{
        return Double(arc4random_uniform(UInt32(max)))
    }
}










