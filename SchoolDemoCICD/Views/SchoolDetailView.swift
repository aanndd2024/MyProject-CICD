//
//  SchoolDetailView.swift
//  SchoolDemoCICD
//
//  Created by Anand Yadav on 02/08/25.
//

import SwiftUI

struct SchoolDetailView: View {
    let school: School
    var body: some View {
        VStack {
            Text(school.overviewParagraph ?? "No Data")
            Spacer()
        }
        .padding()
    }
}


#Preview {
    SchoolDetailView(school: School(dbn: "123", schoolName: "NYC", overviewParagraph: "My Data"))
}
