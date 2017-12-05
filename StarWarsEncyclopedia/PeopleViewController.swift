//
//  ViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Krystyna Swider on 11/12/17.
//  Copyright © 2017 Krystyna Swider. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
    // Hardcoded data for now
    var people: [NSDictionary] = []
    
//    var people = ["Luke Skywalker", "Leia Organa", "Han Solo", "C-3PO", "R2-D2"]
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.getPeopleFromPage(urlString:  "http://swapi.co/api/people/")
        print("'getAllPeople' called in PeopleViewController")
        StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        self.people = results as! [NSDictionary]
//                        for person in results {
//                            let personDict = person as! NSDictionary
//                            self.people.append(personDict["name"]! as! String)
//                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
//        task.resume()
    }
    
//    func getPeopleFromPage(urlString:String){
//        // specify the url that we will be sending the GET Request to
//        let url = URL(string: urlString )
//        // create a URLSession to handle the request tasks
//        let session = URLSession.shared
//        // create a "data task" to make the request and run the completion handler
//        let task = session.dataTask(with: url!, completionHandler: {
//            // see: Swift closure expression syntax
//            data, response, error in
//            print("in here")
//            // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
//            // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
//            do {
//                // try converting the JSON object to "Foundation Types" (NSDictionary, NSMutableDictionary, NSArray, NSMutableArray, NSString, etc.)
//                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    //                    print("jsonresult \(jsonResult)") ----------------> super big object
//                    // Why do we need to optionally unwrap jsonResult["results"]
//                    // Try it without the optional unwrapping and you'll see that the value is actually an optional
//                    if let results = jsonResult["results"] {
//                        // coercing the results object as an NSArray and then storing that in resultsArray
//                        let resultsArray = results as! NSArray
////                         now we can run NSArray methods like count and firstObject
//                        print("result count \(resultsArray.count)")
//                        for object in resultsArray {
//                            let x = object as! NSMutableDictionary
//                            let name = x["name"] as! String
//                            self.people.append(name)
//                        }
//                        //                        print(resultsArray[0])
//                        //                        print(resultsArray.firstObject)                    }
//                    }
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                    if let next = jsonResult["next"] as? String{
//                        self.getPeopleFromPage(urlString: next)
//                    }
//                    else {
//                        print ("Reached last page!")
//                    }
//                }
//            } catch {
//                print(error)
//            }
////
//            // see: Swift nil coalescing operator (double questionmark)
//            print(data ?? "no data") // the "no data" is a default value to use if data is nil
//        })
//        // execute the task and wait for the response before
//        // running the completion handler. This is async!
//        task.resume()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row]["name"] as? String
        return cell
    }
    
    // row clicked
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row clicked in PeopleViewController")
        performSegue(withIdentifier: "seeDetails", sender: people[indexPath.row]) // info from this row will be send to detailsVC
    }
    
    
    // see details about person by clicking row -> prepare for segue and take info from sender to detailsVC to do logic about this person and display in other view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("in 'prepare' function in PeopleViewController")
        let dest = segue.destination as! DetailsVC
        //take info from sender and call it "name"
        if let person = sender as? NSDictionary {
            dest.personInfo = person // personInfo is in dest which is DetailsVC
        }
    }
    
   


}

