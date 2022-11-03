//
//  HomeViewController.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 31/08/22.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    private weak var titleCollection1: UIView.collectionViewTitle?
    var homeCollectionView: UICollectionView?
    private let viewModel = HomeViewModel()
    private weak var logo: UIImageView?
    private weak var logout: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setConstrains()
        viewModel.getImage()
        homeCollectionView?.reloadData()

    }
    
    func initUI() {
        view.backgroundColor = UIColor.backgroundpink
        title = "Home"
        
        let logo = UIImageView(frame: .zero)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        logo.layer.cornerRadius = Constants.width/10
        logo.clipsToBounds = true
        self.view.addSubview(logo)
        self.logo = logo
        
        let logout = UIButton(frame: .zero)
        logout.translatesAutoresizingMaskIntoConstraints = false
        logout.setImage(UIImage(systemName: "arrowshape.turn.up.left.circle"), for: UIControl.State.normal)
        logout.tintColor = .white
        logout.contentVerticalAlignment = .fill
        logout.contentHorizontalAlignment = .fill
        logout.backgroundColor = .darkPink
        logout.addTarget(self, action: #selector(Logout), for: .touchUpInside)
        logout.layer.cornerRadius = Constants.width/20
        logout.clipsToBounds = true
        self.view.addSubview(logout)
        self.logout = logout
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(dismissSelf))

        
        homeCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = Constants.width/15
            layout.minimumInteritemSpacing = Constants.width/10
            
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.register(HomeCollectionView.self, forCellWithReuseIdentifier: "cell")
            collection.isPagingEnabled = true
            collection.translatesAutoresizingMaskIntoConstraints = false
            collection.backgroundColor = UIColor.backgroundpink
            collection.showsVerticalScrollIndicator = true
            collection.showsHorizontalScrollIndicator = true
            return collection
        }()
    
    }
        
        func setConstrains() {
            guard let homeCollectionView = homeCollectionView, let logo = logo, let logout = logout else { return }
            homeCollectionView.delegate = self
            homeCollectionView.dataSource = self
            view.addSubview(homeCollectionView)
            homeCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            logo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            ])
            
            NSLayoutConstraint.activate([homeCollectionView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 30),
                                     homeCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     homeCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                                     homeCollectionView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35)])
            
            NSLayoutConstraint.activate([logout.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
                                         logout.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
                                         logout.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
                                         logout.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            ])
            
        }

    @objc func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func Logout() {
    do {
      try Auth.auth().signOut()
        let goSignIn = SignInViewController()
        goSignIn.modalPresentationStyle = .fullScreen
        present(goSignIn, animated: true, completion: nil)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
        }
    }
}
//MARK: - UICollectionDelegate && UICollectionDataSourse

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.imageSource?.catego?[section].home?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = homeCollectionView?.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionView
        let producto = viewModel.imageSource?.catego?[indexPath.section].home?[indexPath.item]
        cell.setData( home : producto!)
        
    return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return CGSize(width: Constants.width/5 - 10, height: Constants.height / 6 - 30)
    }
}
