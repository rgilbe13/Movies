//
//  DetailViewController.swift
//  Movies
//
//  Created by Rob Gilbert on 8/3/17.
//  Copyright © 2017 Rob Gilbert. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var director: UITextField!
    @IBOutlet weak var rating: UITextField!
    @IBOutlet weak var genre: UILabel!
    
    var movie: Movie?
    
    @IBAction func submit(_ sender: Any) {
        movie = Movie(name: name.text!, year: year.text!, director: director.text!, rating: rating.text!, genre: genre.text!)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.moviesArray.append(movie!)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

