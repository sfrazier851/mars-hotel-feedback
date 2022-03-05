//
//  ExitScreenViewController.swift
//  CustomLaunchScreen
//
//  Created by admin on 3/3/22.
//

import UIKit

class ExitScreenViewController: UIViewController {
    
    

    @IBOutlet weak var exitLabel: UILabel!
    
    @IBOutlet weak var exitEmote: UIImageView!
    
    @IBOutlet weak var exitButtonStyle: UIButton!
    
    @IBOutlet weak var oneStarImage: UIButton!
    
    @IBOutlet weak var twoStarImage: UIButton!
    
    @IBOutlet weak var threeStarImage: UIButton!
    
    @IBOutlet weak var fourStarImage: UIButton!
    
    @IBOutlet weak var fifthStarImage: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        
        // Style the elements
        
        
        Utilities.styleFilledButton(exitButtonStyle)
        
    }
    @IBAction func oneStar(_ sender: Any) {
        oneStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        twoStarImage.setImage(UIImage.init(named: "emptyStar"), for: .normal)
        threeStarImage.setImage(UIImage.init(named: "emptyStar"), for: .normal)
        fourStarImage.setImage(UIImage.init(named: "emptyStar"), for: .normal)
        fifthStarImage.setImage(UIImage.init(named: "emptyStar"), for: .normal)
        exitEmote.image = UIImage.init(named: "slice6")
        
    }
    
    @IBAction func twoStar(_ sender: Any) {
        oneStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        twoStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        threeStarImage.setImage(UIImage.init(named: "emptyStar"), for: .normal)
        fourStarImage.setImage(UIImage.init(named: "emptyStar"), for: .normal)
        fifthStarImage.setImage(UIImage.init(named: "emptyStar"), for: .normal)
        exitEmote.image = UIImage.init(named: "slice5")
    }
    
    @IBAction func threeStar(_ sender: Any) {
        oneStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        twoStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        threeStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        fourStarImage.setImage(UIImage.init(named: "emptyStar"), for: .normal)
        fifthStarImage.setImage(UIImage.init(named: "emptyStar"), for: .normal)
        exitEmote.image = UIImage.init(named: "slice8")
    }
    
    @IBAction func fourthStar(_ sender: Any) {
        oneStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        twoStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        threeStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        fourStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        fifthStarImage.setImage(UIImage.init(named: "emptyStar"), for: .normal)
        exitEmote.image = UIImage.init(named: "slice4")
    }
    
    @IBAction func fifthStar(_ sender: Any) {
        oneStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        twoStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        threeStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        fourStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        fifthStarImage.setImage(UIImage.init(named: "filledStar"), for: .normal)
        exitEmote.image = UIImage.init(named: "slice10")
    }
    
    @IBAction func exitButton(_ sender: Any) {
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
