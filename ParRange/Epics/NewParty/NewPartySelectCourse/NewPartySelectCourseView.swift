//
//  NewPartySelectCourseView.swift
//  ParRange
//
//  Created by Maxence Mottard on 07/05/2021.
//

import SwiftUI

struct NewPartySelectCourseView: View {
    @ObservedObject var viewModel: NewPartySelectCourseViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.courses, id: \._id) { course in
                Text(course.name)
                    .padding()
                    .onTapGesture {
                        withAnimation {
                            viewModel.inputs.selectCourseMethod(course)
                        }
                    }
            }
        }.onAppear(perform: viewModel.fetchCoursess)
    }
}

struct NewPartySelectCourseView_Previews: PreviewProvider {
    static var previews: some View {
        let golf = Golf(
            _id: "ABEA7Z89123N1", name: "Le Golf de Lyon", city: "Lyon", zip: 69007,
            latitude: "10.0", longitude: "10.0", ffgolf_vignette: "",
            ffgolf_photo1: "", ffgolf_photo2: "", ffgolf_photo3: "", ffgolf_large: "")

        ViewProvider.NewParty.selectCourse(selectedGold: golf) { _ in }
    }
}
