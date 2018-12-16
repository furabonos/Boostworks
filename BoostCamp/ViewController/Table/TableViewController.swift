//
//  TableViewController.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 16..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var allInfo: [Movies] = []
    var api = String()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialize()
        setupMovieInfo(pk: 0)
        // Do any additional setup after loading the view.
    }
    
    func setupInitialize() {
        
        self.navigationController?.navigationBar.topItem?.title = "예매율순"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 140
        
        let gear = UIImage(named: "settings2")
        let rightButton = UIBarButtonItem(image: gear, style: .plain, target: self, action: #selector(optionClick))
        navigationItem.rightBarButtonItem = rightButton

        
        let nibName = UINib(nibName: "TableCell", bundle: nil)
        
        tableView.register(nibName, forCellReuseIdentifier: "TableCell")
    }
    
    func setupMovieInfo(pk: Int) {
        
        switch pk {
        case 1:
            api = API.MovieInfo.curationURL
        case 2:
            api = API.MovieInfo.openDateURL
        default:
            api = API.MovieInfo.defaultURL
        }
        
        guard let apiURL = URL(string: api) else { return }
        
        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let decodableValue = try JSONDecoder().decode(Movie.self, from: data)
                self.allInfo = decodableValue.movies
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("failed to fetch movie info : \(error)")
            }
        }
        task.resume()
    }
    
    //tableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        
        DispatchQueue.main.async {
            cell.posterView.loadImage(urlString: self.allInfo[indexPath.row].thumb)
            cell.titleLabel.text = self.allInfo[indexPath.row].title
            cell.gradeLabel.text = "평점 : \(self.allInfo[indexPath.row].userRating)"
            cell.bookGradeLabel.text = "예매순위 : \(self.allInfo[indexPath.row].reservationGrade)"
            cell.bookPerLabel.text = "예매율 : \(self.allInfo[indexPath.row].reservationRate)"
            cell.openDateLabel.text = self.allInfo[indexPath.row].date
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(allInfo[indexPath.row].title, forKey: "movieTitle")
        UserDefaults.standard.set(allInfo[indexPath.row].id, forKey: "movieId")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    //action
    
    @objc func optionClick() {
        let alert: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle:  UIAlertControllerStyle.actionSheet)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "예매율순", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            self.setupMovieInfo(pk: 0)
            self.navigationController?.navigationBar.topItem?.title = "예매율순"
        })
        
        let curationAction: UIAlertAction = UIAlertAction(title: "큐레이션순", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            self.setupMovieInfo(pk: 1)
            self.navigationController?.navigationBar.topItem?.title = "큐레이션순"
        })
        
        let openDataAction: UIAlertAction = UIAlertAction(title: "개봉일순", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            self.setupMovieInfo(pk: 2)
            self.navigationController?.navigationBar.topItem?.title = "개봉일순"
        })
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            print("취소처리")
        })
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        alert.addAction(curationAction)
        alert.addAction(openDataAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
