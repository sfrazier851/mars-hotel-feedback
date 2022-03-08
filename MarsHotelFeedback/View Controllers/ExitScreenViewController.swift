//
//  ExitScreenViewController.swift
//  CustomLaunchScreen
//
//  Created by admin on 3/3/22.
//

import UIKit

class ExitScreenViewController: UIViewController {
    
    var exitCount = 0

    @IBOutlet weak var exitLabel: UILabel!
    
    @IBOutlet weak var exitEmote: UIImageView!
    
    @IBOutlet weak var exitButtonStyle: UIButton!
    
    @IBOutlet weak var oneStarImage: UIButton!
    
    @IBOutlet weak var twoStarImage: UIButton!
    
    @IBOutlet weak var threeStarImage: UIButton!
    
    @IBOutlet weak var fourStarImage: UIButton!
    
    @IBOutlet weak var fifthStarImage: UIButton!
    
    @IBOutlet weak var backgroundButton: UIButton!
    
    @IBOutlet weak var backgroundButton2: UIButton!
    
    @IBOutlet weak var promoLabel: UILabel!
    
    @IBOutlet weak var promoEmote: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        
        // Style the elements
        
        Utilities.styleFilledButton(backgroundButton)
        Utilities.styleFilledButton(backgroundButton2)
        Utilities.styleFilledButton(exitButtonStyle)
        backgroundButton.setTitle("", for: .normal)
        backgroundButton2.setTitle("", for: .normal)
        
    }
    @IBAction func oneStar(_ sender: Any) {
        oneStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        twoStarImage.setImage(UIImage.init(named: "exitScreen/emptyStar"), for: .normal)
        threeStarImage.setImage(UIImage.init(named: "exitScreen/emptyStar"), for: .normal)
        fourStarImage.setImage(UIImage.init(named: "exitScreen/emptyStar"), for: .normal)
        fifthStarImage.setImage(UIImage.init(named: "exitScreen/emptyStar"), for: .normal)
        exitEmote.image = UIImage.init(named: "exitScreen/slice6")
        
    }
    
    @IBAction func twoStar(_ sender: Any) {
        oneStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        twoStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        threeStarImage.setImage(UIImage.init(named: "exitScreen/emptyStar"), for: .normal)
        fourStarImage.setImage(UIImage.init(named: "exitScreen/emptyStar"), for: .normal)
        fifthStarImage.setImage(UIImage.init(named: "exitScreen/emptyStar"), for: .normal)
        exitEmote.image = UIImage.init(named: "exitScreen/slice5")
    }
    
    @IBAction func threeStar(_ sender: Any) {
        oneStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        twoStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        threeStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        fourStarImage.setImage(UIImage.init(named: "exitScreen/emptyStar"), for: .normal)
        fifthStarImage.setImage(UIImage.init(named: "exitScreen/emptyStar"), for: .normal)
        exitEmote.image = UIImage.init(named: "exitScreen/slice8")
    }
    
    @IBAction func fourthStar(_ sender: Any) {
        oneStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        twoStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        threeStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        fourStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        fifthStarImage.setImage(UIImage.init(named: "exitScreen/emptyStar"), for: .normal)
        exitEmote.image = UIImage.init(named: "exitScreen/slice4")
    }
    
    @IBAction func fifthStar(_ sender: Any) {
        oneStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        twoStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        threeStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        fourStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        fifthStarImage.setImage(UIImage.init(named: "exitScreen/filledStar"), for: .normal)
        exitEmote.image = UIImage.init(named: "exitScreen/slice10")
    }
    
    @IBAction func exitButton(_ sender: Any) {
        oneStarImage.isHidden = true
        twoStarImage.isHidden = true
        threeStarImage.isHidden = true
        fourStarImage.isHidden = true
        fifthStarImage.isHidden = true
        exitEmote.isHidden = true
        exitLabel.isHidden = true
        backgroundButton.isHidden = true
        exitButtonStyle.setTitle("Exit", for: .normal)
        backgroundButton2.isHidden = false
        promoLabel.isHidden = false
        promoEmote.isHidden = false
        exitCount += 1
        if exitCount == 2 {
            exit(0)
        }
        
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
