//
//  School.swift
//  SchoolDemoCICD
//
//  Created by Anand Yadav on 02/08/25.
//

import Foundation

struct School: Identifiable, Codable {
    let id = UUID() // for SwiftUI List
    let dbn: String
    let schoolName: String
    let overviewParagraph: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
    }
}
