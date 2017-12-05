//
//  StarWarsModel.swift
//  StarWarsEncyclopedia
//
//  Created by Krystyna Swider on 11/14/17.
//  Copyright © 2017 Krystyna Swider. All rights reserved.
//

import Foundation
class StarWarsModel {
    // Note that we are passing in a function to the getAllPeople method (similar to our use of callbacks in JS). This function will allow the ViewController that calls this method to dictate what runs upon completion.
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        // Specify the url that we will be sending the GET Request to
        let url = URL(string: "http://swapi.co/api/people/")
        // Create a URLSession to handle the request tasks
        let session = URLSession.shared
        // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        // Actually "execute" the task. This is the line that actually makes the request that we set up above
        task.resume()
    }
    
    static func getAllFilms(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "http://swapi.co/api/films/")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    
    static func getOnePerson(name:String, completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        print("in getOnePerson in StarWarsModel")
//        print(encodedName!)
        let url = URL(string: "http://swapi.co/api/people/?search=\(encodedName!)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    
    static func getOneFilms(title:String, completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        print("in get one films in StarWarsModel")
        let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "http://swapi.co/api/films/?search=\(encodedTitle!)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    // LOGIC HIERARCHY (from print):
//    row clicked
//    in 'prepare' function
//    in view did load
//    in get one person
    
}
