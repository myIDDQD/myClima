
import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=af647f4d92b20f6d9991e96ab6122fa7&units=metric&lang=ua"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
    
    func performRequest(urlString: String) {
        // create URL
        
        if let url = URL(string: urlString) {
            // create URLsession
            let session = URLSession(configuration: .default)
            
            // give the session task
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            
            // start task
            task.resume()
            
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
        
    }
}
