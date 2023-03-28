//
//  HeroInfoCollectionViewCell.swift
//  AvangersInfo
//
//  Created by Soatov on 27/03/23.
//

import UIKit
import SnapKit

class HeroInfoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HeroInfoCollectionViewCell"
    
    let scrollView  = UIScrollView()
    let contentsView = UIView()
    
    let name       = UILabel()
    let nameLabel  = UILabel()
    let decription = UILabel()
    let image      = UIImageView()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        setCellItems()
        setScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setScrollView(){
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollView.addSubview(contentsView)
        contentsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func setCellItems(){
        contentsView.addSubview(image)
        image.image = UIImage(named: "hulk")
        image.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.equalTo(contentsView.snp.height).multipliedBy(0.5)
            make.width.equalTo(contentsView.snp.width).multipliedBy(0.5)
        }
//        contentsView.addSubview(nameLabel)
//        nameLabel.text = "Name:"
//        nameLabel.font = UIFont.systemFont(ofSize: 18)
//        name.snp.makeConstraints { make in
//            make.left.equalTo(image.snp.right).offset(5)
//            make.top.equalTo(image.snp.top).offset(10)
//            make.width.equalTo(image.snp.width).multipliedBy(0.5)
//            make.height.equalTo(20)
//            
//        }
//        contentsView.addSubview(name)
//        name.text = "3-D Man"
//        name.font = UIFont.systemFont(ofSize: 18)
//        name.snp.makeConstraints { make in
//            make.left.equalTo(nameLabel.snp.right).offset(2)
//            make.top.equalTo(nameLabel.snp.top)
//            make.height.equalTo(nameLabel.snp.height)
//            make.width.equalTo(image.snp.width).multipliedBy(0.4)
//        }
    }
}
