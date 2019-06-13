
import UIKit
import RealmSwift

class WeatherViewController: UIViewController, UITableViewDataSource {
    
    var newWeather = RealmActualWeather()
    
    var list5: Results<Objects5>!
    
    var categories: [Category] = []
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.label.text = newWeather.actWeather
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return list5.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellWeather") as! TableViewCell
            
            cell.label1.text = list5[indexPath.row].date
            cell.label2.text = list5[indexPath.row].weather
            
            return cell
        }
    
        
        //tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader1 = Loader1()
        
        loader1.load{(string) in
            DispatchQueue.main.async{
                if let string = string{
                    self.label.text = "\(string)"}
                else{self.label.text = "Error"}
                self.newWeather.actWeather = self.label.text ?? "Data Loading"
                WeatherStorage.saveObject(self.newWeather)
                print("New Weather Saved")
            }

        }
        
        loader1.load5Days{categories in
            DispatchQueue.main.async{
                self.categories = categories
                
                self.tableView.reloadData()}
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellWeather") as! TableViewCell
        let model = categories[indexPath.row]
        let kelvin: Double = model.main1["temp"]! as! Double
        let celsius: Int = Int(kelvin) - Int(273.15)
        
        cell.label1.text = model.dtTxt
        cell.label2.text = "Temperature: \(celsius)ºC\n" + "Pressure: \(model.main1["pressure"]!)\n" + "Humidity: \(model.main1["humidity"]!)\n" + "Wind speed: \(model.wind["speed"]!)m/s \n" + "\(model.weather[0]["main"]!)"
        
        let objects = Objects5()
        objects.date = cell.label1.text ?? "Load Date"
        objects.weather = cell.label2.text ?? "Load Weather"
        WeatherStorage.saveObject5(objects)
        
        
        
        return cell
    }
}




