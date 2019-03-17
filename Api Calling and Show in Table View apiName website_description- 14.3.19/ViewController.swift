//
//  ViewController.swift
//  Api Calling and Show in Table View apiName website_description- 14.3.19
//
//  Created by Mohsin Patwary on 14/3/19.
//  Copyright © 2019 Mohsin Patwary. All rights reserved.
// https://api.letsbuildthatapp.com/jsondecodable/website_description

import UIKit
struct Web_Description:Decodable {
    let name:String
    let description:String
    let courses:[Courses]
}
struct Courses:Decodable{
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let number_of_lessons:Int
}
var coursesArray:[Courses] = []

class ViewController: UIViewController {
    let jsonURL = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
    var courseArray:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsingForAPICallData()
    }

    func jsonParsingForAPICallData() {
        guard let url = URL(string: jsonURL) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, Error) in
            guard let data = data else { return }
            
            do{
                let webDescription = try JSONDecoder().decode(Web_Description.self, from: data)
                for index in webDescription.courses{
                    print(index)
                }
               
            }catch let jsonError{
                print("Error : ", jsonError)
            }
        } .resume()
    }
}

