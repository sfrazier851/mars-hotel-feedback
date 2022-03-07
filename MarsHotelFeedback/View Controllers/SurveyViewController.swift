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
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Utilities.styleFilledButton(gymButton)
        Utilities.styleFilledButton(roomButton)
        Utilities.styleFilledButton(foodButton)
    }
    

    
    @IBAction func foodPressed(_ sender: Any) {
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "SurveyVC") as! SurveyVC

        self.navigationController?.pushViewController(nextVC, animated: false)
        nextVC.serviceSelected = 1


    }
    
    
    @IBAction func roomPressed(_ sender: Any) {
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "SurveyVC") as! SurveyVC

        self.navigationController?.pushViewController(nextVC, animated: false)
        nextVC.serviceSelected = 0


    }
    
    @IBAction func gymPressed(_ sender: Any) {
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "SurveyVC") as! SurveyVC

        self.navigationController?.pushViewController(nextVC, animated: false)
        nextVC.serviceSelected = 2


    }
}
