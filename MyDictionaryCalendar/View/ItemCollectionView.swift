//
//  ItemCollectionView.swift
//  MyDictionaryCalendar
//
//  Created by k_motoyama on 2017/04/19.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Foundation
import UIKit

final class ItemCollectionView: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
}
