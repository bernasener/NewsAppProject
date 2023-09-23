//
//  SavedViewController.swift
//  NewsApp
//
//  Created by Berna Şener on 21.09.2023.
//

import UIKit
import Foundation
import Kingfisher
import CoreData



class SavedViewController: UIViewController {
    
    @IBOutlet weak var savedCollectionView: UICollectionView!
    var selectedNews : Article?
    var safeNewsArr = [News]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedCollectionView.delegate = self
        savedCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadItems()
    }
    
    func loadItems() {
        let request: NSFetchRequest<News> = News.fetchRequest()
        
        do {
            safeNewsArr = try context.fetch(request)
        } catch {
            print("Error fetching data from context (error)")
        }
        savedCollectionView.reloadData()
    }
}


extension SavedViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return safeNewsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedCollectionViewCell", for: indexPath) as! SavedCollectionViewCell
        
        let selectedNew = safeNewsArr[indexPath.row]
        cell.savedTitle.text = selectedNew.title
        cell.savedDescription.text = selectedNew.desc
        cell.savedImage.kf.setImage(with: URL(string: selectedNew.image ?? ""))
        
        
        return cell
    }
    
    func collectionView( collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (collectionView.bounds.size.width - 40) / 2, height: collectionView.bounds.size.height / 2)
        }

        func collectionView( collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    
}

