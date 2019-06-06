

import UIKit

class NewItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
}

extension NewItemTableViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
}
