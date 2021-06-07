//
//  PartyListView.swift
//  ParRange
//
//  Created by Maxence Mottard on 24/04/2021.
//

import SwiftUI

struct PartyListView: View {
    @ObservedObject var viewModel: PartyListViewModel
    
    var body: some View {
        VStack {
            Text("Commented")
            NavigationLink(destination: ViewProvider.NewParty.home(), label: {
                Image(systemName: "plus")
            })
        }
    }
}

struct PartyListView_Previews: PreviewProvider {
    static var previews: some View {
        ViewProvider.partyList()
    }
}
