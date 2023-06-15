//
//  CharactersViewController.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import UIKit
import Combine

typealias CharInfo = (imageURL: URL?, title: String, description: String)

final class CharactersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    private let vm = CharacterViewModel()
    
    private var bindings = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        let request = CharacterRequest(q: Environment.shared.paramName)
        searchBar.delegate = self
        searchBar.autocorrectionType = .no

        vm.getCharacters(request)
        
        vm.$searchedChars
            .receive(on: OperationQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &subBag)
    }
    
    private var subBag = Set<AnyCancellable>()
    
    private func setupBinding() {
        vm.$state.receive(on: RunLoop.main).sink(receiveValue: {[weak self] states in
            switch states {
            case .showActivityIndicator:
                self?.showActivity()
            case .showList:
                self?.hideActivity()
                self?.tableView.reloadData()
            case .showError( let message):
                self?.hideActivity()
                self?.showAlert(message:message)
            case .none:
                self?.hideActivity()
            }
        }).store(in: &bindings)
    }
    
    private func showActivity() {
        
    }
    
    private func hideActivity() {
       
    }
    
    func showAlert(title: String = NSLocalizedString("alert", comment:""), message: String, preferredStyle: UIAlertController.Style = .alert, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: completion)
    }
}

extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.searchedChars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard indexPath.row < vm.searchedChars.count else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let topic = vm.retrieveText(indexPath.row).first ?? ""
        cell.textLabel?.text = topic
        
        return cell
    }
}

extension CharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sendInfo = vm.prepareCharInfo(indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(identifier: "CharDetail") as CharacterDetailsViewController
        detailsVC.charDetails = sendInfo
        if UIDevice.current.userInterfaceIdiom == .phone {
            present(detailsVC, animated: true)
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            splitViewController?.setViewController(detailsVC, for: .secondary)
        }
    }
}

extension CharactersViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        vm.searchChar(searchText: searchBar.text ?? "")
    }
}

