//
//  MainPage.swift
//  AvangersInfo
//
//  Created by Soatov on 26/03/23.
//

import UIKit
import SnapKit

class MainPage: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigations()
    }
    
    func setNavigations(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(DismissSelf))
    }
    
    @objc private func DismissSelf(){
        dismiss(animated: true, completion: nil)
        
    }
}
