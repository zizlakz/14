

import UIKit

class NewItemTableViewController: UITableViewController {
    
    var newItem: String?
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBOutlet weak var newItemTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isEnabled = false
        
        newItemTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
    }
    
    func saveNewItem() {
        newItem = newItemTextField.text!
    }
}

extension NewItemTableViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        if newItemTextField.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}
