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
//  MARK: - For voice recognition.
//    var delegate: GoNext?
    var serviceSelected = 0
    
//  MARK: - To instanciate this class.
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableOutlet.register(UINib(nibName: "GradingCell", bundle: nil), forCellReuseIdentifier:  "GradingCell")
//  MARK: - For future reference to compare.
//        tableView.register(GradingCell.nib(), forCellReuseIdentifier: GradingCell.identifier)
        tableOutlet.delegate = self
        tableOutlet.dataSource = self
        tableOutlet.estimatedRowHeight = 145
        tableOutlet.backgroundView = UIImageView(image: UIImage(named: getServiceName(choice: serviceSelected)))
        
        self.serviceTitle.text = getCapitalizedServiceName(Choice: serviceSelected)
    }
    
    func getServiceName(choice : Int) -> String {
        return DataService.instance.getDivision(seq: choice)
    }
    
    func getCapitalizedServiceName(Choice : Int) -> String {
        return getServiceName(choice: Choice).capitalized  + " Service"
    }
    
    func callNext() {
//  MARK: - For future reference.
//        self.delegate?.callNext()
        if serviceSelected < 2 {
            serviceSelected += 1
            self.serviceTitle.text = getCapitalizedServiceName(Choice: serviceSelected)
            tableOutlet.backgroundView = UIImageView(image: UIImage(named: getServiceName(choice: serviceSelected)))
            tableOutlet.reloadData()
        } else {
                //  MARK: - To be interfaced with next screen.
                //Placeholder: "StarVC"
               //
                //            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                //            let nextVC = storyBoard.instantiateViewController(withIdentifier: "StarVC") as! StarVC
                //
                //            nextVC.modalPresentationStyle = .fullScreen
                //            self.present(nextVC, animated: true, completion: nil)
            }

    }
    
    @IBAction func nextAction(_ sender: Any) {
        callNext()
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
         cell.question?.text = DataService.instance.getQuestions(division: DataService.instance.getDivision(seq: serviceSelected))[indexPath.row].questionAsked
        //  MARK: - For future reference to compare.
        //    var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        //            if cell == nil  {
        //                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        //        }
        //        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//  MARK: - Only for iOS 15.0 and above.
//        tableView.sectionHeaderTopPadding = 0
        return 160
    }

}
