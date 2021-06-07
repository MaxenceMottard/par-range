//
//  ViewModel.swift
//  ParRange
//
//  Created by Maxence Mottard on 05/05/2021.
//

import Foundation
import Combine

protocol ViewModelInputs {}
struct EmptyInputs: ViewModelInputs {}

class ViewModel<T: ViewModelInputs>: ObservableObject, Weakable {
    var bag = Set<AnyCancellable>()
    var inputs: T!
    
    func setup(with inputs: T) {
        self.inputs = inputs
        
        bind()
    }
    
    open func bind() {}
}
