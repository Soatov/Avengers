//
//  MainPage.swift
//  AvangersInfo
//
//  Created by Soatov on 26/03/23.
//

import UIKit
import SnapKit

class MainPage: UIViewController {
    
    private var viewModel = HeroesViewModel()
    
    var heroesCollectionView : UICollectionView?
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let nameLabel = UILabel()
    var selectedHeroImage = UIImageView()
    let nameTitle      = UILabel()
    var selectedHeroName = UILabel()
    let descriptionLabel = UILabel()
    var selectedHeroDescription  = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigations()
        setScrollView()
        setHeroesCollectionView()
        loadHeroesData()
    }

    func setNavigations(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissSelf))
    }
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
        
    }
    func setHeroesCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let heroesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(heroesCollectionView)
        
        heroesCollectionView.showsHorizontalScrollIndicator = false
        heroesCollectionView.register(HeroesCollectionViewCell.self, forCellWithReuseIdentifier: HeroesCollectionViewCell.identifier)
        heroesCollectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.13)
        }
        heroesCollectionView.delegate = self

        self.heroesCollectionView = heroesCollectionView
     
    }
    private func loadHeroesData (){
        viewModel.fetchHeroesData { [weak self] in
            self?.heroesCollectionView?.dataSource = self
            self?.heroesCollectionView?.reloadData()
        }
    }
    func setScrollView (){
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
            
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(700)
        }
        contentView.addSubview(selectedHeroImage)
        selectedHeroImage.image = UIImage(named: "3d")
        selectedHeroImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contentView.snp.top).offset(200)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.9)
            make.height.equalTo(contentView.snp.width)
        }
        contentView.addSubview(nameTitle)
        nameTitle.text = "Name:"
        nameTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameTitle.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.left.equalTo(selectedHeroImage.snp.left)
            make.top.equalTo(selectedHeroImage.snp.bottom).offset(10)
        }
        contentView.addSubview(selectedHeroName)
        selectedHeroName.text = "3-D man"
        selectedHeroName.numberOfLines = 0
        selectedHeroName.font = UIFont.systemFont(ofSize: 18)
        selectedHeroName.snp.makeConstraints { make in
            make.left.equalTo(nameTitle.snp.right).offset(60)
            make.top.equalTo(nameTitle.snp.top)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
        }
        contentView.addSubview(descriptionLabel)
        descriptionLabel.text = "Description:"
        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(nameTitle.snp.left)
            make.height.equalTo(nameTitle.snp.height)
            make.top.equalTo(selectedHeroName.snp.bottom).offset(10)
        }
        contentView.addSubview(selectedHeroDescription)
        selectedHeroDescription.text = ""
        selectedHeroDescription.font = UIFont.systemFont(ofSize: 18)
        selectedHeroDescription.numberOfLines = 0
        selectedHeroDescription.snp.makeConstraints { make in
            make.left.equalTo(selectedHeroName.snp.left)
            make.right.equalTo(selectedHeroName.snp.right)
            make.top.equalTo(descriptionLabel.snp.top)
            
            
        }
        
        
    }
}
extension MainPage: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowsInSection(section: section)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: HeroesCollectionViewCell.identifier, for: indexPath) as! HeroesCollectionViewCell
            let hero = viewModel.cellForRowAt(indexPath: indexPath)
            
            cell.setCellWithValueOf(hero)
        
            return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4 )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        selectedHeroName.text = viewModel.cellForRowAt(indexPath: indexPath).name
        selectedHeroDescription.text = viewModel.cellForRowAt(indexPath: indexPath).description
        let imageUR = viewModel.cellForRowAt(indexPath: indexPath).thumbnail.path
        let url = URL(string: "\(imageUR).jpg")
        selectedHeroImage.kf.setImage(with: url)
        
        
        reloadInputViews()
       
        }
   
    
}
