//
//  HomeViewModel.swift
//  TableViewTest
//
//  Created by Mert Deniz Akbaş on 4.09.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    var view: HomeVCProtocol? { get set }
    func viewDidLoad()
}

final class HomeViewModel {
    weak var view: HomeVCProtocol?
    var names = [String]()
}

extension HomeViewModel: HomeViewModelProtocol {
    func viewDidLoad() {
        view?.addNavButton()
    }
}
