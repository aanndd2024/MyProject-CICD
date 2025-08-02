//
//  SchoolListViewModel.swift
//  SchoolDemoCICD
//
//  Created by Anand Yadav on 02/08/25.
//

import Foundation
import Combine

@MainActor
class SchoolViewModel:ObservableObject {
    @Published var schoolData:[School] = []
    @Published var isLoading:Bool = false
    @Published var errorMessage:String?
    
    private let schoolService: SchoolServiceProtocol
    
    init(schoolService: SchoolServiceProtocol = SchoolService(networkManager: NetworkManager())) {
        self.schoolService = schoolService
    }
    
    func fetchSchoolData() async {
        let result = await self.schoolService.fetchSchoolData()
        switch result {
        case .success(let schoolData):
            self.schoolData = schoolData
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
