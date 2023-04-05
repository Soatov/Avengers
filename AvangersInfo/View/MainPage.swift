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
    
    lazy var collectionView = HeroesCollectionView (viewModel: viewModel)
    lazy var contentViews = ContentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigations()
        loadHeroesData()
        initView()
        title = "Avengers"
    }
    func setNavigations(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(dismissSelf))
    }
    
    func initView () {
        self.view.addSubview(collectionView)
        collectionView.navDelegate = self
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(view.snp.height).multipliedBy(0.2)
        }
       
        self.view.addSubview(contentViews)
        contentViews.showsVerticalScrollIndicator = false
        contentViews.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(view.snp.height).multipliedBy(1.5)
        }
    }
    
    private func loadHeroesData (){
        viewModel.fetchHeroesData { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
}
extension MainPage: UpdateContentViewData {
    func getItem(model: Result) {
        contentViews.selectedHeroName.text = model.name
        contentViews.selectedHeroModifiedData.text = model.modified
        contentViews.selectedHeroDescription.text = model.description
        let imageURL = model.thumbnail.path
        let imageType = model.thumbnail.thumbnailExtension
        let url = URL(string: "\(imageURL).\(imageType)")
        contentViews.selectedHeroImage.kf.setImage(with: url)
        
        let stringDate = model.modified
        let expectedFormat = Date.ISO8601FormatStyle()
        let date = try! Date(stringDate, strategy: expectedFormat)
        let removeLastWord = "\(date)".components(separatedBy: "+").dropLast().joined(separator: " ")
        contentViews.selectedHeroModifiedData.text = removeLastWord
    }
}
