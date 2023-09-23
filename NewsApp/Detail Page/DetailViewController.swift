//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Berna Şener on 21.09.2023.
//

import Foundation
import UIKit
import Kingfisher
import CoreData


class DetailViewController: UIViewController {
    
    
    @IBOutlet private weak var detailImage: UIImageView!
    @IBOutlet weak var newTitle: UILabel!
    @IBOutlet weak var Content: UILabel!
    
    var selectedNews : Article?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        Content.text = selectedNews?.description
        newTitle.text = selectedNews?.title
        detailImage.kf.setImage(with: URL(string: selectedNews?.urlToImage ?? ""))
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask ))

        
    }
    
    
    @IBAction func savedButton(_ sender: Any) {
        print(selectedNews)
        let new = News(context: context)
        new.title = selectedNews?.title
        new.id = selectedNews?.source?.id
        new.desc = selectedNews?.description
        new.image = selectedNews?.urlToImage
        
        do {
            try context.save()
            print("Veri başarıyla kaydedildi.")
        } catch {
            print("Veri kaydetme hatası: (error)")
        }
    }
    
}


