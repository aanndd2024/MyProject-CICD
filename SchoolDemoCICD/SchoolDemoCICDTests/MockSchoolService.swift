//
//  MockSchoolService.swift
//  SchoolDemoCICD
//
//  Created by Anand Yadav on 02/08/25.
//

import Foundation
@testable import SchoolDemoCICD

class MockSchoolService: SchoolServiceProtocol {
    var isError:Bool = false
    let schoolData = [School(dbn: "02M260", schoolName: "Clinton School Writers & Artists, M.S. 260", overviewParagraph: "Students who are prepared for college must have an education that encourages them to take risks as they produce and perform. Our college preparatory curriculum develops writers and has built a tight-knit community. Our school develops students who can think analytically and write creatively. Our arts programming builds on our 25 years of experience in visual, performing arts and music on a middle school level. We partner with New Audience and the Whitney Museum as cultural partners. We are a International Baccalaureate (IB) candidate school that offers opportunities to take college courses at neighboring universities."),
    School(dbn: "21K728", schoolName: "Liberation Diploma Plus High School", overviewParagraph: "The mission of Liberation Diploma Plus High School, in partnership with CAMBA, is to develop the student academically, socially, and emotionally. We will equip students with the skills needed to evaluate their options so that they can make informed and appropriate choices and create personal goals for success. Our year-round model (trimesters plus summer school) provides students the opportunity to gain credits and attain required graduation competencies at an accelerated rate. Our partners offer all students career preparation and college exposure. Students have the opportunity to earn college credit(s). In addition to fulfilling New York City graduation requirements, students are required to complete a portfolio to receive a high school diploma."),
    School(dbn: "08X282", schoolName: "Women's Academy of Excellence", overviewParagraph: "The WomenÂ’s Academy of Excellence is an all-girls public high school, serving grades 9-12. Our mission is to create a community of lifelong learners, to nurture the intellectual curiosity and creativity of young women and to address their developmental needs. The school community cultivates dynamic, participatory learning, enabling students to achieve academic success at many levels, especially in the fields of math, science, and civic responsibility. Our scholars are exposed to a challenging curriculum that encourages them to achieve their goals while being empowered to become young women and leaders. Our Philosophy is GIRLS MATTER!")]
    
    func fetchSchoolData() async -> Result<[School], SchoolError> {
        if isError {
            return .failure(.invalidResponse)
        } else {
            return .success(schoolData)
        }
    }
}
