//
//  NewPartySelectGolfView.swift
//  ParRange
//
//  Created by Maxence Mottard on 06/05/2021.
//

import SwiftUI
import RemoteImage

struct NewPartySelectGolfView: View {
    @ObservedObject var viewModel: NewPartySelectGolfViewModel
    
    var body: some View {
        GeometryReader { bounds in
            VStack {
                TextField("", text: $viewModel.searchGolfName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(viewModel.golfs, id: \._id) { golf in
                            VStack {
                                if golf.ffgolf_large != "https://kady.ffgolf.orgnull" {
                                    RemoteImage(type: .url(URL(string: golf.ffgolf_large)!), errorView: { error in
                                        Text(error.localizedDescription)
                                    }, imageView: { image in
                                        image
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                    }, loadingView: {
                                        Text("Loading ...")
                                    })
                                } else {
                                    Rectangle()
                                        .fill(Color.red)
                                        .frame(width: 40, height: 40)
                                }
                                
                                Text(golf.name)
                            }.padding()
                            .frame(width: bounds.size.width * 0.8)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.inputs.selectGolfMethod(golf)
                                }
                            }
                        }
                    }
                }
            }
        }.navigationTitle("Select Golf")
        .onAppear(perform: viewModel.inputs.locationManager.requestLocationAuthorization)
    }
}

struct NewPartySelectGolfView_Previews: PreviewProvider {
    static var previews: some View {
        ViewProvider.NewParty.selectGolf { print($0) }
    }
}
