//
//  Date+RecolorExercise.swift
//  RecolorExercise
//
//  Created by Trong Triet Le on 13/02/2019.
//  Copyright © 2019 Nets AS. All rights reserved.
//

import Foundation

extension Date {
    func normalizeDate(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        
        let iso8601Date = dateFormatter.date(from: dateString) ?? Date()
        
        let normalizedDateFormatter = DateFormatter()
        normalizedDateFormatter.timeZone = TimeZone.current
        normalizedDateFormatter.locale = Locale.current
        normalizedDateFormatter.dateFormat = "EEEE d.M.yyyy HH:mm"
        
        return normalizedDateFormatter.string(from: iso8601Date)
    }
}
