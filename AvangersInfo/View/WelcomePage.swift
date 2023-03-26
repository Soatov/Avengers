//
//  ViewController.swift
//  AvangersInfo
//
//  Created by Soatov on 26/03/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let backgroundImage = UIImageView()
    let welcomeLabel   = UILabel()
    let startButton    = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    func setUpView (){
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "back")
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.addSubview(startButton)
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.layer.cornerRadius = 20
        startButton.backgroundColor = .black
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.height.equalTo(40)
            make.bottom.equalToSuperview().inset(50)
            
        }
    }
    @objc func didTapStartButton(){
        let rootvc = MainPage()
        let vc = UINavigationController(rootViewController: rootvc)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootvc, animated: true)
        present(vc, animated: true, completion: nil)
    }

}



