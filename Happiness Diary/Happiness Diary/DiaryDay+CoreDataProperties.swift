//
//  DiaryDay+CoreDataProperties.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 03.04.21.
//
//

import Foundation
import CoreData


extension DiaryDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryDay> {
        return NSFetchRequest<DiaryDay>(entityName: "DiaryDay")
    }

    @NSManaged public var date: String?
    @NSManaged public var entryOne: String?
    @NSManaged public var entryTwo: String?
    @NSManaged public var entryThree: String?
    @NSManaged public var feeling: Float
    @NSManaged public var weekday: String?

}

extension DiaryDay : Identifiable {

}
