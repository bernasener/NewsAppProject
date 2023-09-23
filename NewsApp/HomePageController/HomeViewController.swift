//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Berna Şener on 18.09.2023.
//

import UIKit
import Kingfisher


class HomeViewController: UIViewController, HomeViewModelDelegate {

    func newsFetched(_ articles: [Article]) {
        newsList = articles
        DispatchQueue.main.async {
                    self.CollectionView.reloadData()
                }
    }
    
    @IBOutlet weak var Searchbar: UISearchBar!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var viewModel = HomeViewModel()
    var newsList: [Article] = []
    private var selectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        prepareCollection()
        prepareNavigationBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

            viewModel.loadNews()

        }

    
    func prepareCollection() {
        CollectionView.delegate = self
        CollectionView.dataSource = self
    }
    
    func prepareNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "NEWS"
    }
    func prepareSearchbar(){
        Searchbar.delegate = self
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_searchBar: UISearchBar, textDidChange searchText: String){
        print(searchText)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.labelTitle.text = newsList[indexPath.row].title
        cell.labelDetail.text = newsList[indexPath.row].description
        cell.Image.kf.setImage(with: URL(string: newsList[indexPath.row].urlToImage ?? ""))
        
        return cell
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.item
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        
        if let vc =  storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.selectedNews = newsList[selectedIndex]
            navigationController?.pushViewController(vc , animated: true)
        }
    }
}


