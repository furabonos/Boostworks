//
//  DetailViewController.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 16..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var viewTitle = String()
    var movieId = String()
    var allInfo: MovieInfo!
    var allComment: Reply!
    var commentCount = Int()
    var api = String()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupInitialize()
        setupMovieInfo(id: movieId)
        setupReply(id: movieId)
    }
    
    func setupInitialize() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewTitle = UserDefaults.standard.string(forKey: "movieTitle")!
        movieId = UserDefaults.standard.string(forKey: "movieId")!
        self.title = viewTitle
        
        let appDomain = Bundle.main.bundleIdentifier
        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
        
        collectionView.register(
            UINib(nibName: "InfoCell", bundle: nil),
            forCellWithReuseIdentifier: "InfoCell"
        )
        
        collectionView.register(
            UINib(nibName: "AnotherCell", bundle: nil),
            forCellWithReuseIdentifier: "AnotherCell"
        )
        
        collectionView.register(
            UINib(nibName: "StoryCell", bundle: nil),
            forCellWithReuseIdentifier: "StoryCell"
        )
        
        collectionView.register(
            UINib(nibName: "CommentCell", bundle: nil),
            forCellWithReuseIdentifier: "CommentCell"
        )
    }
    
    func setupMovieInfo(id: String) {
        
        api = API.MovieDetail.detailURL + id
        
        guard let apiURL = URL(string: api) else { return }
        
        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let decodableValue = try JSONDecoder().decode(MovieInfo.self, from: data)
                self.allInfo = decodableValue
                
                print(self.allInfo!.director)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print("failed to fetch movie info : \(error)")
            }
        }
        task.resume()
    }
    
    func setupReply(id: String) {
        api = API.Replys.replyURL + id
        
        guard let apiURL = URL(string: api) else { return }
        
        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let decodableValue = try JSONDecoder().decode(Reply.self, from: data)
                self.allComment = decodableValue
                self.commentCount = decodableValue.comments.count
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                print(self.commentCount)
            } catch {
                print("failed to fetch movie info : \(error)")
            }
        }
        task.resume()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }else {
            return commentCount
        }
        return allComment!.comments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! InfoCell
                DispatchQueue.main.async {
                    if let allInfos = self.allInfo {
                        cell.posterView.loadImage(urlString: allInfos.image)
                        cell.titleLabel.text = allInfos.title
                        cell.openDataLabel.text = "\(allInfos.date) 개봉"
                        cell.anotherLabel.text = "\(allInfos.genre) / \(allInfos.duration)분"
                    }
                }
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnotherCell", for: indexPath) as! AnotherCell
                DispatchQueue.main.async {
                    if let allInfos = self.allInfo {
                        cell.bookPerLabel.text = "\(allInfos.reservationGrade)위 \(allInfos.reservationRate)"
                        cell.gradeLabel.text = "\(allInfos.userRating)"
                        cell.peopleLabel.text = "\(allInfos.audience)명"
                    }
                }
                return cell
            case 2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
                DispatchQueue.main.async {
                    if let allInfos = self.allInfo {
                        cell.storyLabel.text = allInfos.synopsis
                    }
                }
                return cell
            default:
                break
            }
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommentCell", for: indexPath) as! CommentCell
            DispatchQueue.main.async {
                if let allReplys = self.allComment {
                    cell.idLabel.text = allReplys.comments[indexPath.row].writer
                    cell.commentLabel.text = allReplys.comments[indexPath.row].contents
                    
                    let date = Date(timeIntervalSince1970: allReplys.comments[indexPath.row].timestamp)
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
                    dateFormatter.locale = NSLocale.current
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
                    let strDate = dateFormatter.string(from: date)
                    
                    cell.dateLabel.text = "\(strDate)"
                }
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                return CGSize(width: view.frame.width, height: 180)
            case 1:
                return CGSize(width: view.frame.width, height: 140)
            case 2:
                return CGSize(width: view.frame.width, height: 200)
            default:
                break
            }
        }else {
            return CGSize(width: view.frame.width, height: 150)
        }
        return CGSize(width: view.frame.width, height: 150)
    }

}
