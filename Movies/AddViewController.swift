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
    @IBOutlet weak var genre: UITextField!
    
    var movie: Movie?
    var detailItem: MovieArrayManager?
    var addType: String = ""
    
    @IBAction func submit() {
        if addType == "add" {
            movie = Movie(name: name.text!, year: year.text!, director: director.text!, rating: rating.text!, genre: genre.text!)
            detailItem?.moviesArray.append(movie!)
        } else if addType == "edit" {
            let oldMovie: Movie = movie!
            movie?.name = name.text
            movie?.year = year.text
            movie?.director = director.text
            movie?.rating = rating.text
            movie?.genre = genre.text
            detailItem?.moviesArray.insert(movie!, at: (detailItem?.moviesArray.index(of: oldMovie))!)
            detailItem?.moviesArray.remove(at: (detailItem?.moviesArray.index(of: oldMovie))!)
        }
        
        // push write file to background thread
        DispatchQueue.global(qos: .userInitiated).async {
            self.detailItem?.storeMovieArray()
            DispatchQueue.main.async {
                // no ui updates need done
            }
        }
        
        //detailItem?.storeMovieArray()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let controller = segue.destination  as! DetailViewController
            controller.detailMovieItem = movie
            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
        }
    }
}

