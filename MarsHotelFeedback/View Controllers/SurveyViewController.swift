//
//  SurveyViewController.swift
//  MarsHotelFeedback
//
//  Created by admin on 3/6/22.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBOutlet weak var gymButton: UIButton!
    @IBOutlet weak var roomButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Utilities.styleFilledButtonRed(gymButton)
        Utilities.styleFilledButtonRed(roomButton)
        Utilities.styleFilledButtonRed(foodButton)
    }
    
    @IBAction func foodPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func roomPressed(_ sender: Any) {
        
    }
    
    @IBAction func gymPressed(_ sender: Any) {
        
    }
}
