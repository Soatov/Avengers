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
    let decriptionLabel = UILabel()
    let decriptions = UILabel()
    let image      = UIImageView()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
            make.edges.equalTo(self)
        }
    }
    func setCellItems(){
        contentsView.addSubview(image)
        image.image = UIImage(named: "hulk")
        image.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.equalTo(400)
            make.width.equalTo(contentsView.snp.width)
        }
        contentsView.addSubview(nameLabel)
        nameLabel.text = "Name:"
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(image.snp.left).offset(5)
            make.top.equalTo(image.snp.bottom).offset(5)
        }
        contentsView.addSubview(name)
        name.text = "3-D Man"
        name.font = UIFont.systemFont(ofSize: 18)
        name.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.right).offset(10)
            make.top.equalTo(nameLabel.snp.top)
        }
        contentsView.addSubview(decriptionLabel)
        decriptionLabel.text = "Description:"
        decriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        decriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        contentsView.addSubview(decriptions)
        decriptions.text = """
        Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!
        """
        decriptions.font = UIFont.systemFont(ofSize: 18)
        decriptions.numberOfLines = 0
        decriptions.snp.makeConstraints { make in
            make.left.equalTo(decriptionLabel.snp.right).offset(10)
            make.top.equalTo(decriptionLabel.snp.top)
            make.right.equalToSuperview().inset(10)
        }
        
    }
}
