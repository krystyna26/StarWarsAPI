//
//  DetailVC.swift
//  StarWarsEncyclopedia
//
//  Created by Krystyna Swider on 11/14/17.
//  Copyright © 2017 Krystyna Swider. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
 
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    var personName: String? // personName comes from PeopleVC segue
    var personInfo: NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in view did load in DetailsVC")
        
        let name = self.personInfo["name"]! as! String
        let gender = self.personInfo["gender"]! as! String
        let birth = self.personInfo["birth_year"]! as! String
        let mass = self.personInfo["mass"]! as! String
        self.nameLabel.text = name
        self.genderLabel.text = gender
        self.birthLabel.text = birth
        self.massLabel.text = mass
        
        
//        StarWarsModel.getOnePerson(name:personName!,completionHandler: { // passing what becomes "completionHandler" in the 'getOnePerson' function definition in StarWarsModel.swift
//            data, response, error in
//            do {
//                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
//                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    if let results = jsonResult["results"] as? NSArray {
//                        if let personDict = results[0] as? NSDictionary { // will give me obj with name = <\(name)> from StarWarsModel which goes from PeopleVC sender: <people[indexPath.row]> which holds name from particular row
//                            self.personInfo = personDict
//                        }
//                    }
//                }
//                DispatchQueue.main.async {
//                    let name = self.personInfo["name"]! as! String
//                    let gender = self.personInfo["gender"]! as! String
//                    let birth = self.personInfo["birth_year"]! as! String
//                    let mass = self.personInfo["mass"]! as! String
//                    self.nameLabel.text = name
//                    self.genderLabel.text = gender
//                    self.birthLabel.text = birth
//                    self.massLabel.text = mass
//                    print("did DispatchQueue.main.async in DetailsVC")
//                }
//            } catch {
//                print("Something went wrong")
//            }
//        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
