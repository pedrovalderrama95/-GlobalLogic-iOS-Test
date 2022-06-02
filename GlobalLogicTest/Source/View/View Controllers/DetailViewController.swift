//
//  DetailViewController.swift
//  GlobalLogicTest
//
//  Created by Pedro Valderrama on 31/05/2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var detailImageView: UIImageView!
    
    var item: ItemList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SingleLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "SingleLabelTableViewCell")
        
        navigationController?.navigationBar.tintColor = .black
        
        detailImageView.kf.setImage(with: item.image)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailImageView.layer.cornerRadius = 3
    }
    
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SingleLabelTableViewCell") as? SingleLabelTableViewCell else { return UITableViewCell() }
        cell.setData(item: item)
        return cell
    }
    
}
