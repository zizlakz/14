

import UIKit

class ToDoTableViewController: UITableViewController {
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listToDo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = listToDo[indexPath.row]


        return cell
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        guard  let newItemVC = segue.source as? NewItemTableViewController else {
            return}
        newItemVC.saveNewItem()
        listToDo.append(newItemVC.newItem!)
        tableView.reloadData()
        
    }
 


}
