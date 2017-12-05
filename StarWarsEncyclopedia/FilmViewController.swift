//
//  FilmViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Krystyna Swider on 11/13/17.
//  Copyright © 2017 Krystyna Swider. All rights reserved.
//

import UIKit

class FilmViewController: UITableViewController {

    var film: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.getFilms(urlString: "https://swapi.co/api/films/") ----> was before
        print("'getAllFilms' called")
        StarWarsModel.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllFilms' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for title in results {
                            let titleDict = title as! NSDictionary
                            self.film.append(titleDict["title"]! as! String)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
    }
    
//    func getFilms(urlString:String){
//        let url = URL(string: urlString )
//        let session = URLSession.shared
//        let task = session.dataTask(with: url!, completionHandler: {
//            data, response, error in
//            do{
//                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    if let result = jsonResult["results"] {
//                        let resultArray = result as! NSArray
//                        for obj in resultArray {
//                            let t = obj as! NSDictionary
//                            let oneTitle = t["title"] as! String
//                            self.film.append(oneTitle)
//                        }
//                    }
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                }
//            } catch {
//                print(error)
//            }
//                print(data ?? "no data")
//        })
//            task.resume()
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number section in row: \(film.count)")
        return film.count
    }

        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
        cell.textLabel?.text = film[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("'prepare' called - segue to show film detail")
        let destination = segue.destination as! FilmDetailsVC
        if let title = sender as? String {
            destination.filmTitle = title
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "filmDetails", sender: film[indexPath.row])
    }
    
    
    
}
