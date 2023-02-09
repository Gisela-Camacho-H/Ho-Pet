//
//  SearchViewController.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 09/02/23.
//

import UIKit

class SearchViewController: UIViewController {

    var allBreed: AllBreeds?
    lazy var allBreedTableView = UITableView()
    var keysArray : [String] = []
    var searchkeyArray : [String] = []
    var searchTextField : UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        fetchingAllBreed(URL: "https://dog.ceo/api/breeds/list/all") { result in
                         self.allBreed = result
                         DispatchQueue.main.async{
                             self.searchkeyArray = Array(result.message.keys)
                             self.keysArray = Array(result.message.keys)
                             self.allBreedTableView.reloadData()
                         }
        }
        
        initUI()
        
    }
    
    
    func fetchingAllBreed(URL Url: String, completion: @escaping (AllBreeds) -> Void) {
        
        let url =  URL(string: Url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error  in
            do {
                let fetchingData = try JSONDecoder().decode(AllBreeds.self, from: data!)
                    completion(fetchingData)
                }catch (let error){
                    print(error)
            }
        }
        dataTask.resume()
    }
    
    func initUI() {
        
        searchTextField = UITextField(frame: CGRect(x: 10, y: 80, width: Constants.width - 20, height: 40))
        searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        searchTextField.layer.borderColor =  UIColor.darkPink.cgColor
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.cornerRadius =  15
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 10))
        searchTextField.leftViewMode = UITextField.ViewMode.always
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        
        allBreedTableView = UITableView(frame: CGRect(x: 0, y: Constants.height/4, width: Constants.width, height: Constants.height))
        allBreedTableView.backgroundColor = .clear
        allBreedTableView.center.x = self.view.center.x
        allBreedTableView.delegate = self
        allBreedTableView.dataSource = self
        view.addSubview(allBreedTableView)
        allBreedTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
        searchkeyArray = keysArray.filter( {key in
            return key.contains(textfield.text ?? "")
        })
        print(textfield.text)
        allBreedTableView.reloadData()
    }
}

extension SearchViewController : UITableViewDelegate{
    // numero de secciones que vamos a usar
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

// MARK: - UITableDataSource

extension SearchViewController : UITableViewDataSource{
    // numero de celdas por cada secciones que tiene cada categoria
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchkeyArray.count ?? 0
    }
    //tipo de celda que se mostrara
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BreedTableViewCell(breed: searchkeyArray[indexPath.row] )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
}
