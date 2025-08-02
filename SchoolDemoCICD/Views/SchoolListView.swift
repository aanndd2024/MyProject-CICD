//
//  SchoolListView.swift
//  SchoolDemoCICD
//
//  Created by Anand Yadav on 02/08/25.
//

import SwiftUI

struct SchoolListView: View {
    @StateObject private var viewModel = SchoolViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .backgroundStyle(Color.red)
            } else {
                List(viewModel.schoolData) { school in
                    NavigationLink(destination: SchoolDetailView(school: school)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(school.dbn)
                                .font(.headline)
                            Text(school.schoolName)
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.fetchSchoolData()
        }
    }
}
