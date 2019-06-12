import UIKit
import CoreData

class ToDo2_TableViewController: UITableViewController {
    
    var toDoItems: [Task] = []
    
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
    
        let ac = UIAlertController(title: "Add New Item", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) {action in
            let textField = ac.textFields?[0]
            if textField!.text?.isEmpty == false {
                self.saveTask(taskToDo: (textField?.text)! )
                self.tableView.reloadData()}
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        ac.addTextField{
            textField in
        }
        ac.addAction(ok)
        ac.addAction(cancel)
        present(ac, animated: true)
    }
    
    func saveTask(taskToDo: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! Task
        taskObject.taskToDo = taskToDo
        do {
            try context.save()
            toDoItems.append(taskObject)
            print("Saved!")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do{
            toDoItems = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        
        //let task = toDoItems[indexPath.row]
        cell.textLabel?.text = toDoItems[indexPath.row].taskToDo
        
        return cell
}
}
