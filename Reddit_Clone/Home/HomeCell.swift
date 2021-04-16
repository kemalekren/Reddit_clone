//
//  HomeCell.swift
//  Reddit_Clone
//
//  Created by Kemal Ekren on 15.04.2021.
//

import UIKit

final class HomeCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postTag: UILabel!
    @IBOutlet weak var postDesc: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postVote: UILabel!
    @IBOutlet weak var postComment: UILabel!
    
    var item: HomePresentation! {
        didSet {
            userName.text = item.username
            postDate.text = item.date
            postTitle.text = item.title
            postTag.text = item.postTag
            postTag.backgroundColor = UIColor(hexString: item.postTagColor)
            postTag.layer.cornerRadius = 5
            postTag.layer.masksToBounds = true
           
            postVote.text = item.rateCount
            postComment.text = item.commentCount
           
            

            if item.description.isEmpty {
                postDesc.isHidden = true
            }else {
                postDesc.isHidden = false
                postDesc.text = item.description
            }
            
            if let url = URL(string: item.postImage ?? "") {
                url.loadImageDataWith(url: url) { (data, error) in
                    if let error = error {
                        self.postImage.isHidden = true
                        print(error.localizedDescription)
                    } else {
                        if let data = data  {
                            DispatchQueue.main.async {
                                self.postImage.image = UIImage(data: data)
                            }
                        }
                    }
                }
            }
        }
    }
    
}
