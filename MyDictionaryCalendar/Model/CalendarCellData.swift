//
//  CalendarCellData.swift
//  CalendarChallenge
//
//  Created by k_motoyama on 2017/03/15.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Foundation
import STV_Extensions

class CalendarCellData{
    
    let weekNameData = ["日","月","火","水","木","金","土"]
    
    // 今月のセル数（表示日数）を戻す
    func getCellCount() -> Int {
        
        let calendar = Calendar(identifier: .gregorian)
        
        let rangeOfWeeks = calendar.range(of: .weekOfMonth, in: .month, for: Date().startOfMonth()!)
        
        if let weekCount = rangeOfWeeks?.count{
            return weekCount * 7
        } else {
            return 0
        }
        
    }
    
    // 今月の日付データを戻す
    func getCellDate(cellCount: Int) -> [Date]{
        
        let firstDate = Date().startOfMonth()!
        
        var arrDispDate = [Date]()
        
        let calendar = Calendar(identifier: .gregorian)
        let ordinality = calendar.ordinality(of: .day, in: .weekOfMonth, for: firstDate) ?? 0
        
        
        for i in 0 ..< cellCount {
            var dateComponents = DateComponents()
            dateComponents.day = i - (ordinality - 1)
            
            arrDispDate.append(calendar.date(byAdding: dateComponents, to: firstDate)!)
        }
        
        return arrDispDate
        
    }
    
    func getWeekName(indexPathRow: Int) -> String {
        return weekNameData[indexPathRow]
    }
    
    func getWeekNameCount() -> Int {
        return weekNameData.count
    }
    
}
