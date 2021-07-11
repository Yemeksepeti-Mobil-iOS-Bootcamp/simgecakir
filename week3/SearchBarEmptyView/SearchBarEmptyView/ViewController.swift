//
//  ViewController.swift
//  SearchBarEmptyView
//
//  Created by Simge on 9.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let urlStr = "https://jsonplaceholder.typicode.com/users"
        guard let userURL = URL(string: urlStr) else { return }
        let userList = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL))
        
        guard let users = userList else { return }
        self.users = users
        
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            filteredUsers.count == 0 ? self.tableView.setEmptyMessage("Person not Found", image: UIImage(systemName: "person.2")!) : self.tableView.restore()
            return filteredUsers.count
        }
        return users.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")
        let user: User
        
        if isFiltering{
            user = filteredUsers[indexPath.row]
        } else {
            user = users[indexPath.row]
        }
        cell?.textLabel?.text = user.name
        cell?.detailTextLabel?.text = user.company.name
        return cell!
    }
    
}

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredUsers = users.filter({ (user: User) -> Bool in
            return user.name.lowercased().contains(searchText.lowercased())
        })
        isFiltering = true
        tableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}

extension UITableView {
    
    func setEmptyMessage(_ message: String, image: UIImage){
        
        let containerView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.width, height: self.bounds.height))
        
        let imageView = UIImageView()
        imageView.image = image
        
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "arial-boldmt", size: 25)
        messageLabel.sizeToFit()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 200).isActive = true
        imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        containerView.addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25).isActive = true
        messageLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
        self.backgroundView = containerView
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
