

import UIKit

class ToDoTableViewController: UITableViewController {
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]


        return cell
    }
    
    @IBAction func calcelAction(_ segue: UIStoryboardSegue){}
 


}
