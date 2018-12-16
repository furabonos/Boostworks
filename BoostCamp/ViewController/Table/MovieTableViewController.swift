////
////  MovieTableViewController.swift
////  BoostCamp
////
////  Created by 엄태형 on 2018. 12. 16..
////  Copyright © 2018년 엄태형. All rights reserved.
////
//
//import UIKit
//
//class MovieTableViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    var allInfo: [Movies] = []
//    var api = String()
////    private let movieService: MovieServiceType = MovieService()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupInitialize()
//        setupMovieInfo(pk: 0)
//
//        // Do any additional setup after loading the view.
//    }
//
//    func setupInitialize() {
//        collectionView.delegate = self
//        collectionView.dataSource = self
//
//        collectionView.register(
//            UINib(nibName: "MovieCell", bundle: nil),
//            forCellWithReuseIdentifier: "MovieCell"
//        )
//    }
//
//    func setupMovieInfo(pk: Int) {
//
//        switch pk {
//        case 1:
//            api = API.MovieInfo.curationURL
//        case 2:
//            api = API.MovieInfo.openDateURL
//        default:
//            api = API.MovieInfo.defaultURL
//        }
//
//        guard let apiURL = URL(string: api) else { return }
//
//        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
//
//            guard let data = data else { return }
//
//            do {
//                let decodableValue = try JSONDecoder().decode(Movie.self, from: data)
//                self.allInfo = decodableValue.movies
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//            } catch {
//                print("failed to fetch movie info : \(error)")
//            }
//        }
//        task.resume()
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    //collectionView
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return allInfo.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
//
//        DispatchQueue.main.async {
//            cell.posterView.loadImage(urlString: self.allInfo[indexPath.row].thumb)
//            cell.titleLabel.text = self.allInfo[indexPath.row].title
//            cell.gradeLabel.text = "평점 : \(self.allInfo[indexPath.row].userRating)"
//            cell.bookGradeLabel.text = "예매순위 : \(self.allInfo[indexPath.row].reservationGrade)"
//            cell.bookPerLabel.text = "예매율 : \(self.allInfo[indexPath.row].reservationRate)"
//            cell.openDateLabel.text = self.allInfo[indexPath.row].date
//        }
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 375, height: 120)
//    }
//
//    //action
//    @IBAction func optionClick(_ sender: Any) {
//
//    }
//
//
//}
