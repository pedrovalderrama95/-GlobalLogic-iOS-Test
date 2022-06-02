//
//  ViewModel.swift
//  GlobalLogicTest
//
//  Created by Pedro Valderrama on 01/06/2022.
//

import Moya
import ProgressHUD

protocol ViewModelDelegate: AnyObject {
    func reloadTableView()
    func onError(error: Error)
}

class ViewModel: APIRequestable {
    
    lazy var provider: MoyaProvider<NetworkService> = MoyaProvider<NetworkService>()
    var list: [ItemList] = []
    weak var delegate: ViewModelDelegate?
    
    func getData() {
        
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.show("")
        
        request(target: .getInfo, model: [ItemList].self) { [weak self] result in
            
            ProgressHUD.dismiss()

            switch result {
            case let .success(response):
                self?.list = response
                self?.delegate?.reloadTableView()
            case let .failure(error):
                self?.delegate?.onError(error: error)
            }
        }
    }
    
}
