//
//  SchoolViewModelTest.swift
//  SchoolDemoCICD
//
//  Created by Anand Yadav on 02/08/25.
//

import XCTest
@testable import SchoolDemoCICD

@MainActor
class SchoolViewModelText: XCTestCase {
    func testFetchSchoolData_success() async {
        let viewModel = SchoolViewModel(schoolService: MockSchoolService())
        await viewModel.fetchSchoolData()
        XCTAssertEqual(viewModel.schoolData.count, 3)
    }
    
    func testFetchSchoolData_failure() async {
        let mockService = MockSchoolService()
        mockService.isError = true
        let viewModel = SchoolViewModel(schoolService: mockService)
        await viewModel.fetchSchoolData()
        XCTAssertEqual(viewModel.errorMessage, "The server response was invalid")
    }
    
    func testFetchSchoolData_loadingStatus() async {
        let viewModel = SchoolViewModel(schoolService: MockSchoolService())
        viewModel.isLoading = true
        XCTAssertTrue(viewModel.isLoading)
        await viewModel.fetchSchoolData()
        XCTAssertFalse(viewModel.isLoading)
    }
}
