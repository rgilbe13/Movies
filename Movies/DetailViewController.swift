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
    
    var detailMovieItem: MovieMO? {
        didSet {
            configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        self.title = self.detailMovieItem?.name
        name?.text = self.detailMovieItem?.name
        year?.text = self.detailMovieItem?.year
        director?.text = self.detailMovieItem?.director
        rating?.text = self.detailMovieItem?.rating
        genre?.text = self.detailMovieItem?.genre
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
        let controller = segue.destination as! AddViewController
        controller.detailMovieItem = detailMovieItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

