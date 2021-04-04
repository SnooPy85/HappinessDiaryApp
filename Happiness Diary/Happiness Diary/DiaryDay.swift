//
//  DiaryDay.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 03.04.21.
//

import Foundation
import CoreData

@objc(DiaryDay)
public class DiaryDay: NSManagedObject, Identifiable {
    
    @NSManaged public var date: String?
    @NSManaged public var entryOne: String?
    @NSManaged public var entryTwo: String?
    @NSManaged public var entryThree: String?
    @NSManaged public var feeling: Float
    @NSManaged public var weekday: String?
    
}

extension DiaryDay {

}

