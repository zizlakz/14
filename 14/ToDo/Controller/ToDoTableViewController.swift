

import UIKit
import RealmSwift

class ToDoTableViewController: UITableViewController {
    
    var list: Results<Items>!
        

    override func viewDidLoad() {
        super.viewDidLoad()

        list = realm.objects(Items.self)
        
        tableView.tableFooterView = UIView()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.isEmpty ? 0 : list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row].item


        return cell
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        guard  let newItemVC = segue.source as? NewItemTableViewController else {
            return}
        newItemVC.saveNewItem()

        tableView.reloadData()
        
    }
 


}
