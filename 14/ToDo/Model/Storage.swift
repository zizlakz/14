

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ item: Items){
        try! realm.write {
            realm.add(item)
        }
    }
    
}
