
import RealmSwift


class RealmActualWeather: Object{
    
    @objc dynamic var actWeather = ""
    
}

class Objects5: Object{
    @objc dynamic var date = ""
    @objc dynamic var weather = ""
}



let realmWeather = try! Realm()
let realmWeather5 = try! Realm()

class WeatherStorage {
    static func saveObject(_ actWeather: RealmActualWeather){
        try! realmWeather.write {
            realmWeather.add(actWeather)
        }
    }
    
    static func deletObject(_ item: Items){
        try! realm.write {
            realm.delete(item)
        }
    }
    
    static func saveObject5(_ objects5: Objects5){
        try! realmWeather5.write {
            realmWeather5.add(objects5)
        }
    }
    
}

