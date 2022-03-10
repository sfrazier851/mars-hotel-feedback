//
//  ViewController.swift
//  Combo
//
//  Created by Young Ju on 3/3/22.
//

import UIKit
import Speech

//  MARK: - For voice recognition.
//protocol GoNext {
//    func callNext()
//}
class SurveyVC: UIViewController {

    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var tableOutlet: UITableView!
    @IBOutlet weak var nextButton: UIButton!
        //  MARK: - For voice recognition.
//    var delegate: GoNext?
    var userType = 0
    var surveyType = 0
    
//  MARK: - To instanciate this class when called from elsewhere.
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        surveyType = userType
        tableOutlet.register(UINib(nibName: "GradingCell", bundle: nil), forCellReuseIdentifier:  "GradingCell")
//  MARK: - For future reference to compare.
//        tableView.register(GradingCell.nib(), forCellReuseIdentifier: GradingCell.identifier)
        tableOutlet.delegate = self
        tableOutlet.dataSource = self
        tableOutlet.estimatedRowHeight = 145
        tableOutlet.backgroundView = UIImageView(image: UIImage(named: getServiceName(choice: surveyType)))
        
        self.serviceTitle.text = getCapitalizedServiceName(Choice: surveyType)
        if (surveyType == 2 || userType != 0) {
            nextButton.setTitle("Submit", for: .normal)
        }
        Utilities.styleFilledButton(nextButton)
    }
    
    func getServiceName(choice : Int) -> String {
        return DataService.instance.getDivision(seq: choice)
    }
    
    func getCapitalizedServiceName(Choice : Int) -> String {
        return getServiceName(choice: Choice).capitalized  + " Service"
    }
    
    func callNext() {
        surveyType = DataService.currentSurveyType
        
        if (userType == 0 && surveyType < 2) {
            surveyType += 1
            self.serviceTitle.text = getCapitalizedServiceName(Choice: surveyType)
            tableOutlet.backgroundView = UIImageView(image: UIImage(named: getServiceName(choice: surveyType)))
            tableOutlet.reloadData()
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyBoard.instantiateViewController(withIdentifier: "ExitScreenViewController") as! ExitScreenViewController
             self.navigationController?.pushViewController(nextVC, animated: false)
            }
    }
    
    func goNext() {
        if DataService.currentSurveyType == 1 {
            nextButton.setTitle("Submit", for: .normal)
        }
            
        callNext()
        DataService.currentSurveyType += 1
    }
    
    func popIncompleteAlert(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
//        for (index, option) in options.enumerated() {
//            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
//                completion(index)
//            }))
                alertController.addAction(UIAlertAction.init(title: "Yes", style: .default, handler: { (action) in
                    completion(0)
                }))
                    alertController.addAction(UIAlertAction.init(title: "No", style: .destructive, handler: { (action) in
                        completion(1)
                    }))
        self.present(alertController, animated: true, completion: nil)
    }
    

    
    @IBAction func nextAction(_ sender: Any) {
        let numberOfAnswered =  DataService.numberOfAnswered
        if numberOfAnswered >= 3  {
            DataService.numberOfAnswered = 0
            goNext()
        } else {
            popIncompleteAlert(title: "Could you rate all three?", message: "", options: "Yes", "No") {(option) in
                    switch(option) {
                        case 0:
                            return
                        case 1:
                            DataService.numberOfAnswered = 0
                            self.goNext()
                        default:
                            break
                    }
                }
            }
        }
    }

extension SurveyVC: UITableViewDelegate, UITableViewDataSource {
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "GradingCell")
            as? GradingCell else {
                    fatalError("Unable to create survey table view cell")
        }
    
        //  MARK: - For future reference to unwrapping ways.
        //    var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        //            if cell == nil  {
        //                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        //        }
        //        cell.delegate = self
    cell.question?.text = DataService.instance.getQuestions(division: DataService.instance.getDivision(seq: surveyType))[indexPath.row].questionAsked
    cell.marsCheck.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//  MARK: - Only for iOS 15.0 and above.
//        tableView.sectionHeaderTopPadding = 0
        return 160
    }

}
