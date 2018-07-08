//
//  HighscoreController.swift
//  RUAZOSI_2018_projekt
//
//  Created by Lea Rački on 08/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import UIKit

class HighscoreController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var highscoreTable: UITableView!
    
    let cellReuseIdentifier = "cellReuseIdentifier"
    
    var player: String?
    var score: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true

        self.backgroundImage.image = UIImage(named: "background.jpg")
        
        highscoreTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        setupTableView()
    }
    
    func setupTableView() {
        highscoreTable.delegate = self
        highscoreTable.dataSource = self
    }
}

extension HighscoreController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //var tmpMovieTitle = viewModel.film(atIndex: indexPath.row)?.title
        
        //viewModel.fetchMovie(currentTitle: tmpMovieTitle!) { [weak self] (movies) in
            //let viewController = SearchResultControllerViewController()
            //viewController.movie = self?.viewModel.film(atIndex: indexPath.row)
            
            //self?.navigationController?.pushViewController(viewController, animated: true)
        //}
    }
}

extension HighscoreController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        //if let movie = viewModel.film(atIndex: indexPath.row) {
            //cell.textLabel?.text = movie.title
        //}
        
        cell.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        cell.textLabel?.text = "11         -           Lea"
        cell.textLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 30)
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //viewModel.numberOfFilms()
    }
}
