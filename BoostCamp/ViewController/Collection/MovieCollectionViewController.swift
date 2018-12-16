//
//  MovieCollectionViewController.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 16..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

class MovieCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var allInfo: [Movies] = []
    var api = String()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialize()
        setupMovieInfo(pk: 0)
        // Do any additional setup after loading the view.
    }
    
    func setupInitialize() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
        let screenWidth = view.frame.width
        layout.itemSize = CGSize(width: screenWidth / 2, height: screenWidth / 2)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        collectionView!.collectionViewLayout = layout
        
        self.navigationController?.navigationBar.topItem?.title = "예매율순"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let gear = UIImage(named: "settings2")
        let rightButton = UIBarButtonItem(image: gear, style: .plain, target: self, action: #selector(optionClick))
        navigationItem.rightBarButtonItem = rightButton
        
        collectionView.register(
            UINib(nibName: "CollectionCell", bundle: nil),
            forCellWithReuseIdentifier: "CollectionCell"
        )
        
        
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
                    self.collectionView.reloadData()
                }
            } catch {
                print("failed to fetch movie info : \(error)")
            }
        }
        task.resume()
    }
    
    //collectionView
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return allInfo.count
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
    
            DispatchQueue.main.async {
                cell.posterView.loadImage(urlString: self.allInfo[indexPath.row].thumb)
                cell.titleLabel.text = self.allInfo[indexPath.row].title
                cell.infoLabel.text = "\(self.allInfo[indexPath.row].reservationGrade)위(\(self.allInfo[indexPath.row].userRating)) / \(self.allInfo[indexPath.row].reservationRate)%"
                cell.openDateLabel.text = self.allInfo[indexPath.row].date
            }
            return cell
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (view.frame.width / 2) - 30
            return CGSize(width: width, height: 250)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
