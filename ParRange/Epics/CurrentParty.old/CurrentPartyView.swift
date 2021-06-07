////
////  CurrentPartyView.swift
////  ParRange
////
////  Created by Maxence Mottard on 24/04/2021.
////
//
//import SwiftUI
//
//struct CurrentPartyView: View {
//    @ObservedObject var viewModel: CurrentPartyViewModel
//    
//    @State var pickerParValue: Int = Hole.Par.three.rawValue
//    @State var pickerScoreValue: Int = Hole.Par.three.rawValue
//    
//    var body: some View {
//        ZStack {
//            VStack {
//                Text("Nouvelle Partie")
//                
//                Text(viewModel.formatedElapsedTime)
//                    .padding(.vertical, 50)
//                    .font(.system(size: 75))
//                Spacer()
//                holeList
//                Group{
//                    if viewModel.state == .notStarted {
//                        Text("Not Started")
//                    } else if viewModel.state == .breaked {
//                        Text("Break")
//                    } else if [CurrentPartyViewModel.State.started, CurrentPartyViewModel.State.breaked].contains(viewModel.state) {
//                        CurrentHoleView(hole: viewModel.currentHole) {
//                            withAnimation {
//                                viewModel.popupIsOpen = true
//                            }
//                        }
//                    } else {
//                        Text("Stop")
//                    }
//                }.padding(.bottom, 50)
//                playButton
//            }.padding()
//            
//            Popup($viewModel.popupIsOpen) {
//                ViewProvider.CurrentParty.popup(hole: viewModel.currentHole, handleValidate: viewModel.handleValidatePopup(par:score:))
//            }
//        }.onChange(of: viewModel.currentHole) { _ in 
//            pickerScoreValue = viewModel.currentHole.par.rawValue
//        }
//    }
//    
//    var holeList: some View {
//        HStack {
//            VStack {
//                ForEach(viewModel.course.holes, id: \.holeNumber) { hole in
//                    Text("\(hole.name.capitalized) \(hole.formatedPar.capitalized)")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                }
//            }.padding(.horizontal)
//            VStack {
//                ForEach(viewModel.course.holes, id: \.holeNumber) { hole in
//                    Text("\(hole.formatedScore)")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                }
//            }.padding(.horizontal)
//        }.padding(.vertical)
//    }
//    
//    var playButton: some View {
//        Button {
//            if [CurrentPartyViewModel.State.notStarted, CurrentPartyViewModel.State.breaked].contains(viewModel.state) {
//                viewModel.startParty()
//            } else if viewModel.state == .started {
//                viewModel.breakParty()
//            }
//        } label: {
//            switch viewModel.state {
//            case .notStarted, .breaked:
//                Image(systemName: "play.fill")
//                    .font(.system(size: 30))
//                    .customCircleButtonGlowed()
//            case .started:
//                Image(systemName: "pause.fill")
//                    .font(.system(size: 30))
//                    .customCircleButtonGlowed()
//            case .ended:
//                Image(systemName: "stop.fill")
//                    .customCircleButton(color: .gray)
//            }
//        }
//    }
//}
//
//struct CurrentPartyView_Previews: PreviewProvider {
//    static var course: Course {
////        let hole1 = Hole(par: .three, holeNumber: 1)
////        let hole2 = Hole(par: .four, holeNumber: 2)
////        let hole3 = Hole(par: .four, holeNumber: 3)
////
////        hole1.addScore(score: 5)
////        hole2.addScore(score: 5)
////        hole3.addScore(score: -1)
//        
//        let course = Course(type: .nine)
////        course.holes = [hole1, hole2, hole3]
//        
//        return course
//    }
//    
//    static var previews: some View {
//        ViewProvider.CurrentParty.home(course: self.course)
//    }
//}
//

import SwiftUI
extension Color {
    static let primaryColor = Color("PrimaryColor")
    static let backgroundColor = Color("BackgroundColor")
}
