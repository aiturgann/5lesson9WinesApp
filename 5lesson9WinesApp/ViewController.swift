//
//  ViewController.swift
//  5lesson9WinesApp
//
//  Created by Aiturgan Kurmanbekova on 8/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    let wineService = WineService.shared
    
    private var wines: [Wine] = []
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.backgroundImage = UIImage()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 120)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(WineCell.self, forCellWithReuseIdentifier: WineCell.reuseId)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(named: "light_gray")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "light_gray")
        // Do any additional setup after loading the view.
        wineService.getWines { wineList in
            self.wines = wineList
            self.collectionView.reloadData()
        }
        setupUI()
        setupNavItem()
    }
    
    private func setupNavItem() {
        navigationItem.title = "Wine List"
        let navItemUserButton = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(userBtnTppd))
        navItemUserButton.tintColor = .black
        navigationItem.rightBarButtonItem = navItemUserButton
    }
    
    @objc private func userBtnTppd() {
        
    }
    
    private func setupUI() {
        view.addSubview(searchBar)
        NSLayoutConstraint.activate(
            [searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
             searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate(
            [collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
             collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WineCell.reuseId, for: indexPath) as! WineCell
        cell.setData(wine: wines[indexPath.row])
//        cell.backgroundColor = UIColor(named: "wine_color")
        cell.layer.cornerRadius = 22
        cell.backgroundColor = .white
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
     
}

