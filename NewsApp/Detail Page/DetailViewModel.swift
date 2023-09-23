//
//  DetailViewModel.swift
//  NewsApp
//
//  Created by Berna Şener on 21.09.2023.
//

import Foundation

 final class DetailViewModel {
     
     private var selectedNewsID:Int
     
     
     weak var delegate: HomeViewModelDelegate?


     init(selectedNewsID: Int) {
         self.selectedNewsID = selectedNewsID
     }
 }

