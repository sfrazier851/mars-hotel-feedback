    //
    //  SurveyTableViewCell.swift
    //  Combo
    //
    //  Created by Young Ju on 3/3/22.
    //
 //
//  GradingCell.swift
//  Combo
//
//  Created by Young Ju on 3/5/22.
//

import UIKit

class GradingCell: UITableViewCell {
    
    static let identifier = "GradingCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "GradingCell", bundle: nil)
    }
    
    @IBOutlet weak var question: UILabel!
     @IBOutlet weak var marsCheck: UIImageView!
    
//   checkForUp.isHidden = true
//    checkForUp.isHidden = true
//    checkForUp.isHidden = true
 
    func checkButton(posX:CGFloat, posY: CGFloat) {
        if marsCheck.isHidden == true {
            marsCheck.isHidden = false}
        marsCheck.frame.origin.x = posX
        marsCheck.frame.origin.y = posY
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let a = sender.frame.origin.x
        let b = sender.frame.origin.y
        checkButton(posX: a, posY: b)
    }
}




