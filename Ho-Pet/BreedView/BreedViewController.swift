//
//  BreedViewController.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 19/09/22.
//

import UIKit

class BreedViewController: UIViewController {

    private weak var titleCollection1: UIView.collectionViewTitle?
    private weak var titleCollection2: UIView.collectionViewTitle?
    private weak var titleCollection3: UIView.collectionViewTitle?
    private weak var titleCollection4: UIView.collectionViewTitle?
    private weak var titleCollection5: UIView.collectionViewTitle?
    private weak var titleCollection6: UIView.collectionViewTitle?
    private weak var titleCollection7: UIView.collectionViewTitle?
    var dataAkita: DogModel?
    var dataBeagle: DogModel?
    var dataChow: DogModel?
    var dataDoberman: DogModel?
    var dataEskimo: DogModel?
    var dataGermanshepherd: DogModel?
    var dataHusky: DogModel?
    var akitaCollectionView: UICollectionView?
    var beagleCollectionView: UICollectionView?
    var chowCollectionView: UICollectionView?
    var dobermanCollectionView: UICollectionView?
    var eskimoCollectionView: UICollectionView?
    var germanshepherdCollectionView: UICollectionView?
    var huskyCollectionView: UICollectionView?
    var collectionStackView: UIStackView?
    static var imageCache: [String: UIImage] = [:]
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setConstrains()
    }
    func initUI() {
        view.backgroundColor = .white
        title = "Breed"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(dismissSelf))
        
        let collectionStackView = UIStackView(frame: .zero)
        self.collectionStackView = collectionStackView
        collectionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(collectionStackView)
        
        // collectionView name
        let titleCollection1 = UIView.collectionViewTitle(frame: .zero)
        titleCollection1.text = "        Akita"
        self.view.addSubview(titleCollection1)
        self.titleCollection1 = titleCollection1
        
        let titleCollection2 = UIView.collectionViewTitle(frame: .zero)
        titleCollection2.text = "        Beagle"
        self.view.addSubview(titleCollection2)
        titleCollection2.translatesAutoresizingMaskIntoConstraints = false
        self.titleCollection2 = titleCollection2
        
        let titleCollection3 = UIView.collectionViewTitle(frame: .zero)
        titleCollection3.text = "        Chow - Chow"
        self.view.addSubview(titleCollection3)
        titleCollection3.translatesAutoresizingMaskIntoConstraints = false
        self.titleCollection3 = titleCollection3
        
        let titleCollection4 = UIView.collectionViewTitle(frame: .zero)
        titleCollection4.text = "        Doberman"
        self.view.addSubview(titleCollection4)
        titleCollection4.translatesAutoresizingMaskIntoConstraints = false
        self.titleCollection4 = titleCollection4
        
        let titleCollection5 = UIView.collectionViewTitle(frame: .zero)
        titleCollection5.text = "        Eskimo"
        self.view.addSubview(titleCollection5)
        titleCollection5.translatesAutoresizingMaskIntoConstraints = false
        self.titleCollection5 = titleCollection5
        
        let titleCollection6 = UIView.collectionViewTitle(frame: .zero)
        titleCollection6.text = "        Germanshepherd"
        self.view.addSubview(titleCollection6)
        titleCollection6.translatesAutoresizingMaskIntoConstraints = false
        self.titleCollection6 = titleCollection6
        
        let titleCollection7 = UIView.collectionViewTitle(frame: .zero)
        titleCollection7.text = "        Husky"
        self.view.addSubview(titleCollection7)
        titleCollection7.translatesAutoresizingMaskIntoConstraints = false
        self.titleCollection7 = titleCollection7
        
        func createCollectionView() -> UICollectionView {
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
        }
        
        akitaCollectionView = createCollectionView()
        beagleCollectionView = createCollectionView()
        chowCollectionView = createCollectionView()
        dobermanCollectionView = createCollectionView()
        eskimoCollectionView = createCollectionView()
        germanshepherdCollectionView = createCollectionView()
        huskyCollectionView = createCollectionView()
        
        

        
        fetchingAPIDogs(URL: "https://dog.ceo/api/breed/akita/images") { result in
            self.dataAkita = result
            DispatchQueue.main.async{
                self.akitaCollectionView?.reloadData()
            }
        }
        
        fetchingAPIDogs(URL: "https://dog.ceo/api/breed/beagle/images") { result in
            self.dataBeagle = result
            DispatchQueue.main.async{
                self.beagleCollectionView?.reloadData()
            }
        }
        
        fetchingAPIDogs(URL: "https://dog.ceo/api/breed/chow/images") { result in
            self.dataChow = result
            DispatchQueue.main.async{
                self.chowCollectionView?.reloadData()
            }
        }
        
        fetchingAPIDogs(URL: "https://dog.ceo/api/breed/doberman/images") { result in
            self.dataDoberman = result
            DispatchQueue.main.async{
                self.dobermanCollectionView?.reloadData()
            }
        }
        
        fetchingAPIDogs(URL: "https://dog.ceo/api/breed/eskimo/images") { result in
            self.dataEskimo = result
            DispatchQueue.main.async{
                self.eskimoCollectionView?.reloadData()
            }
        }
        
        fetchingAPIDogs(URL: "https://dog.ceo/api/breed/germanshepherd/images") { result in
            self.dataGermanshepherd = result
            DispatchQueue.main.async{
                self.germanshepherdCollectionView?.reloadData()
            }
        }
        
        fetchingAPIDogs(URL: "https://dog.ceo/api/breed/husky/images") { result in
            self.dataHusky = result
            DispatchQueue.main.async{
                self.huskyCollectionView?.reloadData()
            }
        }
    }
        
        func setConstrains() {
            guard let akitaCollectionView = akitaCollectionView, let titleCollection1 = titleCollection1,
                  let titleCollection2 = titleCollection2, let beagleCollectionView = beagleCollectionView , let chowCollectionView = chowCollectionView, let titleCollection3 = titleCollection3, let dobermanCollectionView = dobermanCollectionView, let titleCollection4 = titleCollection4, let collectionStackView = collectionStackView, let titleCollection5 = titleCollection5, let eskimoCollectionView = eskimoCollectionView, let titleCollection6 = titleCollection6, let germanshepherdCollectionView = germanshepherdCollectionView, let titleCollection7 = titleCollection7, let huskyCollectionView = huskyCollectionView else { return }
            
            akitaCollectionView.delegate = self
            akitaCollectionView.dataSource = self
            view.addSubview(akitaCollectionView)
            akitaCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            beagleCollectionView.delegate = self
            beagleCollectionView.dataSource = self
            view.addSubview(beagleCollectionView)
            beagleCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            chowCollectionView.delegate = self
            chowCollectionView.dataSource = self
            view.addSubview(chowCollectionView)
            chowCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            dobermanCollectionView.delegate = self
            dobermanCollectionView.dataSource = self
            view.addSubview(dobermanCollectionView)
            dobermanCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            eskimoCollectionView.delegate = self
            eskimoCollectionView.dataSource = self
            view.addSubview(eskimoCollectionView)
            eskimoCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            germanshepherdCollectionView.delegate = self
            germanshepherdCollectionView.dataSource = self
            view.addSubview(germanshepherdCollectionView)
            germanshepherdCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            huskyCollectionView.delegate = self
            huskyCollectionView.dataSource = self
            view.addSubview(huskyCollectionView)
            huskyCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            let collectionArray: [UIView] = [titleCollection1, akitaCollectionView, titleCollection2, beagleCollectionView, titleCollection3, chowCollectionView, titleCollection4, dobermanCollectionView, titleCollection5, eskimoCollectionView, titleCollection6,germanshepherdCollectionView, titleCollection7, huskyCollectionView]
            
            collectionStackView.axis = .vertical
            collectionStackView.spacing = 10
            collectionStackView.alignment = .fill
            collectionStackView.distribution = .equalSpacing
            collectionArray.forEach {element in
            collectionStackView.addArrangedSubview(element)
                if element is UICollectionView {
                    NSLayoutConstraint.activate([
                        element.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.17)])
                } else {
                    NSLayoutConstraint.activate([
                        element.heightAnchor.constraint(equalToConstant: 20)])
                }
            }
            
            NSLayoutConstraint.activate([collectionStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            collectionStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            collectionStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1.0),
                                         collectionStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])
            
            NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                         scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                         scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
                                         scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0)
                                         
            ])
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
    
    func fetchingAPIData<T: Decodable>(URL Url: String, completion: @escaping (T) -> Void) {
        
        let url =  URL(string: Url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error  in
            do {
                let fetchingData = try JSONDecoder().decode(T.self, from: data!)
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

extension BreedViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case akitaCollectionView:
            return dataAkita?.message.count ?? 0
        case beagleCollectionView:
            return dataBeagle?.message.count ?? 0
        case chowCollectionView:
            return dataChow?.message.count ?? 0
        case dobermanCollectionView:
            return dataDoberman?.message.count ?? 0
        case eskimoCollectionView:
            return dataEskimo?.message.count ?? 0
        case germanshepherdCollectionView:
            return dataGermanshepherd?.message.count ?? 0
        case huskyCollectionView:
            return dataHusky?.message.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = akitaCollectionView?.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DogCollectionView
        var data: String?
        switch collectionView {
        case akitaCollectionView:
            data = dataAkita?.message[indexPath.row]
        case beagleCollectionView:
            data = dataBeagle?.message[indexPath.row]
        case chowCollectionView:
            data = dataChow?.message[indexPath.row]
        case dobermanCollectionView:
            data = dataDoberman?.message[indexPath.row]
        case eskimoCollectionView:
            data = dataEskimo?.message[indexPath.row]
        case germanshepherdCollectionView:
            data = dataGermanshepherd?.message[indexPath.row]
        case huskyCollectionView:
            data = dataHusky?.message[indexPath.row]
        default:
            print("no data")
        }
        
        if let apiData = data {
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
        
        if let imageCache = BreedViewController.imageCache[url.absoluteString] {
            self.image = imageCache
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                    BreedViewController.imageCache[url.absoluteString] = image
                    print(url.absoluteString)
                }
            }.resume()
        }
        
}
        
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode )
    }
}
