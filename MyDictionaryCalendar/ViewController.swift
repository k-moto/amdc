//
//  ViewController.swift
//  MyDictionaryCalendar
//
//  Created by k_motoyama on 2017/04/18.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let calendarCellData = CalendarCellData()

    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarCollectionView.dataSource = self
        calendarCollectionView.delegate = self

    }

}

// MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return calendarCellData.getWeekNameCount()
            
        } else {
            return calendarCellData.getCellCount()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionView.identifier, for: indexPath) as! ItemCollectionView
        if indexPath.section == 0 {
            cell.textLabel.text = calendarCellData.getWeekName(indexPathRow: indexPath.row)
            
        } else {
            let dispDate = calendarCellData.getCellDate(cellCount: calendarCellData.getCellCount())[indexPath.row]
            cell.textLabel.text =  dispDate.toStr(dateFormat: "d")
            
        }
        
        return cell
    }
    
}

//MARK:-UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin: CGFloat = 8.0
        
        let cellWidth: CGFloat = (collectionView.frame.size.width - 2.0 * numberOfMargin) / CGFloat(7)
        
        let cellHeight: CGFloat = cellWidth * 1.0
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2.0
    }
    
    
}

