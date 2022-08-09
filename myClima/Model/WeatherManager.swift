
import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=af647f4d92b20f6d9991e96ab6122fa7&units=metric&lang=ua"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        self.performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // create URL
        
        if let url = URL(string: urlString) {
            // create URLsession
            let session = URLSession(configuration: .default)
            
            // give the session task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weather: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weather: Data) {
        let decoder = JSONDecoder()
        decoder.decode(WeatherData.self, from: weat)
    }
    
}
