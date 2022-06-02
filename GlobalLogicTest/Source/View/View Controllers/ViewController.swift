//
//  ViewController.swift
//  GlobalLogicTest
//
//  Created by Pedro Valderrama on 31/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BaseTableViewCell", bundle: nil), forCellReuseIdentifier: "BaseTableViewCell")
        viewModel.delegate = self
        viewModel.getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController,
              let item = sender as? ItemList else { return }
        detailVC.item = item
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTableViewCell") as? BaseTableViewCell else { return UITableViewCell() }
        cell.setData(item: viewModel.list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.list[indexPath.row]
        performSegue(withIdentifier: "PresentDetailVC", sender: item)
    }
    
}

extension ViewController: ViewModelDelegate {
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func onError(error: Error) {
        showAlert(title: "Oops!", message: error.localizedDescription) { [weak self] _ in
            self?.viewModel.getData()
        }
    }
    
}
