//
//  PartyListView.swift
//  ParRange
//
//  Created by Maxence Mottard on 24/04/2021.
//

import SwiftUI

struct PartyListView: View {
    var body: some View {
        ViewProvider.CurrentParty.home(course: Course(type: .nine))
    }
}

struct PArtyListView_Previews: PreviewProvider {
    static var previews: some View {
        PartyListView()
    }
}
