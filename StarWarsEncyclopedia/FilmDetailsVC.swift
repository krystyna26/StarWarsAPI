//
//  FilmDetailsVC.swift
//  StarWarsEncyclopedia
//
//  Created by Krystyna Swider on 11/14/17.
//  Copyright © 2017 Krystyna Swider. All rights reserved.
//

import UIKit

class FilmDetailsVC: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UITextView!
    
    var filmTitle: String?
    var filmInfo: NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("'getOneFilm' called in FilmDetailsVC")
        StarWarsModel.getOneFilms(title:filmTitle!, completionHandler: {
         data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        if let filmsDictionary = results[0] as? NSDictionary {
                            self.filmInfo = filmsDictionary
                        }
                    }
                }
            DispatchQueue.main.async {
                let title = self.filmInfo["title"]! as! String
                let date = self.filmInfo["release_date"]! as! String
                let director = self.filmInfo["director"]! as! String
                let openingCrawl = self.filmInfo["opening_crawl"]! as! String
                self.titleLabel.text = title
                self.dateLabel.text = date
                self.directorLabel.text = director
                self.openingCrawlLabel.text = openingCrawl
                }
            }catch {
                print("Something went wrong")
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
