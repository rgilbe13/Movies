//
//  DetailViewController.swift
//  Movies
//
//  Created by Rob Gilbert on 8/3/17.
//  Copyright © 2017 Rob Gilbert. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var director: UITextField!
    @IBOutlet weak var rating: UITextField!
    @IBOutlet weak var genre: UITextField!
    
    var movie: MovieMO = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: CoreDataStack.persistentContainer.viewContext) as! MovieMO
    
    @IBAction func submit() {
        movie.director = director.text
        movie.name = name.text
        movie.year = year.text
        movie.rating = rating.text
        movie.genre = genre.text
        CoreDataStack.saveContext()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        controller.detailMovieItem = movie
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination  as! DetailViewController
        controller.detailMovieItem = movie
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
    }
    
    var detailMovieItem: MovieMO? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailMovieItem {
            self.title = detail.name
            name?.text = detail.name
            year?.text = detail.year
            director?.text = detail.director
            rating?.text = detail.rating
            genre?.text = detail.genre
        }
    }

}

