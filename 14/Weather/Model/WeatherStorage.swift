
import Foundation

class WeatherStorage{
    static let shared = WeatherStorage()
    
    private let kActWeatherKey = "WeatherStorage.kActWeatherKey"
    
    var actWeather: String? {
        set { UserDefaults.standard.set(newValue, forKey: kActWeatherKey)}
        get { return UserDefaults.standard.string(forKey: kActWeatherKey) }
    }
}



