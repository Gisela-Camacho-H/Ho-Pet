//
//  HomeViewController.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 31/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private weak var titleCollection1: UIView.collectionViewTitle?
    private weak var titleCollection2: UIView.collectionViewTitle?
    var data: DogModel?
    var akitaCollectionView: UICollectionView?
    var beagleCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setConstrains()
    }
    func initUI() {
        view.backgroundColor = .white
        title = "Welcome"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(dismissSelf))
        
        // collectionView name
        let titleCollection1 = UIView.collectionViewTitle(frame: CGRect(x: 0, y: 100 , width: Constants.width, height: 40))
        titleCollection1.text = "        Akita"
        self.view.addSubview(titleCollection1)
        self.titleCollection1 = titleCollection1
        
        let titleCollection2 = UIView.collectionViewTitle(frame: .zero)
        titleCollection2.text = "        Beagle"
        self.view.addSubview(titleCollection2)
        titleCollection2.translatesAutoresizingMaskIntoConstraints = false
        self.titleCollection2 = titleCollection2
        
        akitaCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = Constants.width/15
            layout.minimumInteritemSpacing = Constants.width/10
            
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.register(DogCollectionView.self, forCellWithReuseIdentifier: "cell")
            collection.isPagingEnabled = true
            collection.translatesAutoresizingMaskIntoConstraints = false
            collection.backgroundColor = .white
            collection.showsVerticalScrollIndicator = true
            collection.showsHorizontalScrollIndicator = true
            return collection
        }()
        
        
        beagleCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = Constants.width/15
            layout.minimumInteritemSpacing = Constants.width/10
            
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.register(DogCollectionView.self, forCellWithReuseIdentifier: "cell")
            collection.isPagingEnabled = true
            collection.translatesAutoresizingMaskIntoConstraints = false
            collection.backgroundColor = .white
            collection.showsVerticalScrollIndicator = true
            collection.showsHorizontalScrollIndicator = true
            return collection
        }()
        
        fetchingAPIDogs(URL: "https://dog.ceo/api/breed/akita/images") { result in
            self.data = result
            DispatchQueue.main.async{
                self.akitaCollectionView?.reloadData()
            }
        }
        
        fetchingAPIDogs(URL: "https://dog.ceo/api/breed/beagle/images") { result in
            self.data = result
            DispatchQueue.main.async{
                self.beagleCollectionView?.reloadData()
            }
        }
    }
        
        func setConstrains() {
            guard let akitaCollectionView = akitaCollectionView, let titleCollection1 = titleCollection1,
                  let titleCollection2 = titleCollection2, let beagleCollectionView = beagleCollectionView else { return }
            akitaCollectionView.delegate = self
            akitaCollectionView.dataSource = self
            view.addSubview(akitaCollectionView)
            akitaCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            beagleCollectionView.delegate = self
            beagleCollectionView.dataSource = self
            view.addSubview(beagleCollectionView)
            beagleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
            NSLayoutConstraint.activate([akitaCollectionView.topAnchor.constraint(equalTo: titleCollection1.bottomAnchor, constant: 10),
                                     akitaCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     akitaCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                                     akitaCollectionView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35)])
            
            
           
            NSLayoutConstraint.activate([titleCollection2.topAnchor.constraint(equalTo: akitaCollectionView.bottomAnchor, constant: 10),
                                         titleCollection2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                         titleCollection2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
                                         titleCollection2.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1)])
            
            
            NSLayoutConstraint.activate([
                                    beagleCollectionView.topAnchor.constraint(equalTo: titleCollection2.bottomAnchor, constant: 10),
                                    beagleCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                    beagleCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                                    beagleCollectionView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35)])
            
        }
    
    

    
    func fetchingAPIDogs(URL Url: String, completion: @escaping (DogModel) -> Void) {
        
        let url =  URL(string: Url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error  in
            do {
                let fetchingData = try JSONDecoder().decode(DogModel.self, from: data!)
                    completion(fetchingData)
                }catch (let error){
                    print(error)
            }
        }
        dataTask.resume()
    }

    @objc func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
}
//MARK: - UICollectionDelegate && UICollectionDataSourse

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.message.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = akitaCollectionView?.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DogCollectionView
        if let apiData = data?.message[indexPath.row] {
        let url = URL(string: apiData)
            cell.imageDog.downloaded(from: url!, contentMode: .scaleToFill)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return CGSize(width: Constants.width/4 - 20, height: Constants.height / 5 - 50)
    }
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
