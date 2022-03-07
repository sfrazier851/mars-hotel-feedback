//
//  HomeViewController.swift
//  CustomLaunchScreen
//
//  Created by iMac on 2/28/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Utilities.styleFilledButton(welcomeButton)

    }
    

    @IBAction func welcomePressed(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
