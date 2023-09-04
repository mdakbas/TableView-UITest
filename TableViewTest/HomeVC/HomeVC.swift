//
//  HomeVC.swift
//  TableViewTest
//
//  Created by Mert Deniz Akbaş on 4.09.2023.
//

import UIKit

protocol HomeVCProtocol: AnyObject {
    func addNavButton()
}

final class HomeVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
}

extension HomeVC: HomeVCProtocol {
    func addNavButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
    }
    
    @objc func addButton() {
        let ac = UIAlertController(title: "Add Noise Maker", message: "What's the name of the noise maker?", preferredStyle: .alert)
        ac.addTextField { textField in
            textField.placeholder = "Shaggy"
            
        }
        ac.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak ac , weak self] _ in
            guard let textField = ac?.textFields?[0] else { return }
            guard let userText = textField.text else { return }
            guard !userText.isEmpty else { return }
            guard let self else { return }
            self.viewModel.names.insert(userText, at: 0)
            self.tableView.insertRows(at: [IndexPath.init(row: 0, section: 0)], with: .automatic)
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(ac, animated: true)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
