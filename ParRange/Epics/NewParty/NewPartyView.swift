//
//  NewPartyView.swift
//  ParRange
//
//  Created by Maxence Mottard on 06/05/2021.
//

import SwiftUI

struct NewPartyView: View {
    @ObservedObject var viewModel: NewPartyViewModel
    
    var body: some View {
        VStack {
            if viewModel.state == .party {
                Text("Party")
            } else if viewModel.state == .selectCourse, let selectedGolf = viewModel.selectedGolf {
                ViewProvider.NewParty.selectCourse(
                    selectedGold: selectedGolf,
                    selectCourseMethod: viewModel.selectCourse(course:)
                ).transition(.move(edge: .leading))
            } else {
                ViewProvider.NewParty.selectGolf(selectGolfMethod: viewModel.selectGolf(golf:))
                    .transition(.move(edge: .leading))
            }
        }.onDisappear(perform: viewModel.resetViewModel)
    }
}

struct NewPartyView_Previews: PreviewProvider {
    static var previews: some View {
        ViewProvider.NewParty.home()
    }
}
