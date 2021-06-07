//
//  NewPartySelectGolfViewModel.swift
//  ParRange
//
//  Created by Maxence Mottard on 06/05/2021.
//

import Foundation
import Combine
import CoreLocation
import SwiftUI

struct NewPartySelectGolfViewModelInputs: ViewModelInputs {
    let getGolfsRouting: GetGolfsRouting!
    let selectGolfMethod: ((Golf) -> Void)!
    let locationManager: LocationManager
}

class NewPartySelectGolfViewModel: ViewModel<NewPartySelectGolfViewModelInputs> {
    @Published var searchGolfName: String = ""
    @Published var golfs: [Golf] = []
    
    override func bind() {
        inputs.locationManager.$coordinate
            .flatMap{ [weak self] coordinate -> AnyPublisher<[Golf], Error> in
                guard let strongSelf = self, strongSelf.golfs.count == 0,
                      let latitude = coordinate?.latitude.description,
                      let longitude = coordinate?.longitude.description else { return AnyPublisher(Empty()) }
                
                let parameters = GetGolfsRoutingParameters(latitude: latitude, longitude: longitude)
                return strongSelf.inputs.getGolfsRouting.call(with: parameters)
            }.sink(receiveCompletion: { _ in }) { [weak self] golfs in
                guard let strongSelf = self else { return }
                
                strongSelf.golfs = golfs
            }.store(in: &bag)
        
        $searchGolfName
            .flatMap { [weak self] name -> AnyPublisher<[Golf], Error> in
                guard name.count >= 3, let strongSelf = self else { return AnyPublisher(Empty()) }
                
                return strongSelf.inputs.getGolfsRouting.call(with: .init(name: name))
            }.sink(receiveCompletion: { _ in }) { [weak self] golfs in
                guard let strongSelf = self else { return }
                
                strongSelf.golfs = golfs
            }.store(in: &bag)
    }
}
