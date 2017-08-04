//
//  DetailViewController.swift
//  Movies
//
//  Created by Rob Gilbert on 8/3/17.
//  Copyright © 2017 Rob Gilbert. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var year: UILabel?
    @IBOutlet weak var director: UILabel?
    @IBOutlet weak var rating: UILabel?
    @IBOutlet weak var genre: UILabel?

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
           self.title = detail.name
            name?.text = detail.name
            year?.text = detail.year
            director?.text = detail.director
            rating?.text = detail.rating
            genre?.text = detail.genre
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSeque" {
            let controller = segue.destination as! AddViewController
            controller.movie = detailItem
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.configureView()
    }

    var detailItem: Movie? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

