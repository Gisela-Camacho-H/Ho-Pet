//
//  HomeViewController.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 31/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
       
    }
    func initUI() {
        view.backgroundColor = .white
        title = "Welcome"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(dismissSelf))
    }

    @objc func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
}
