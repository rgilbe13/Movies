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
        if movie == nil {
            movie = Movie(name: name.text!, year: year.text!, director: director.text!, rating: rating.text!, genre: genre.text!)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.moviesArray.append(movie!)
        } else {
            movie?.name = name.text
            movie?.year = year.text
            movie?.director = director.text
            movie?.rating = rating.text
            movie?.genre = genre.text
        }
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let movie = movie {
            name.text = movie.name
            year.text = movie.year
            director.text = movie.director
            rating.text = movie.rating
            genre.text = movie.genre
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

