//
//  SchoolService.swift
//  SchoolDemoCICD
//
//  Created by Anand Yadav on 02/08/25.
//

import Foundation

protocol SchoolServiceProtocol {
    func fetchSchoolData() async -> Result<[School], SchoolError>
}

class SchoolService:SchoolServiceProtocol {
    let schoolDataUrl = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    private let networkManager: NetworkServiceProtocol
    
    init(networkManager: NetworkServiceProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchSchoolData() async -> Result<[School], SchoolError> {
        guard let url = URL(string: schoolDataUrl) else {
            return .failure(.invalidURL)
        }
        do {
            let schoolData:[School] = try await self.networkManager.request(url: url)
            print("✅ Success: \(schoolData)")
            return .success(schoolData)
        } catch let error as SchoolError {
            print("❌ Error: \(error)")
            return .failure(error)
        } catch {
            print("❌ Error: \(error)")
            return .failure(.invalidData)
        }
    }
}
