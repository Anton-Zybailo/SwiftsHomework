//
//  ViewSessionController.swift
//  FirstProject
//
//  Created by Антон on 07/07/2019.
//  Copyright © 2019 Антон. All rights reserved.
//

import Foundation
import Alamofire
import WebKit

class ViewSessionController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet{
            webView.navigationDelegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // разлогин
//        logoutVK()
        
        
        // авторизация VK
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7047946"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
        
    }

}


extension ViewSessionController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
            let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        
//        print(token)
        
        // получение списка друзей
        AF.request("https://api.vk.com/method/friends.get?random&access_token=\(token!)&v=5.95").responseJSON { (response) in
            print(response.value)
        }
        // получение групп
        AF.request("https://api.vk.com/method/groups.get?extended=1&access_token=\(token!)&v=5.95").responseJSON { (response) in
            print(response.value)
        }
        // получение фото
        AF.request("https://api.vk.com/method/photos.getAll?extended=1&access_token=\(token!)&v=5.95").responseJSON { (response) in
            print(response.value)
        }
        
        
        decisionHandler(.cancel)
    }
    
    // метод чтобы разлогиниться
    func logoutVK() {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            dataStore.removeData(
                ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(),
                for: records.filter { $0.displayName.contains("vk")},
                completionHandler: { }
            )
        }
    }
}



// singleton для хранения данных о текущей сессии

class Session {
    
    static let instance = Session()
    
    private init () {}
    
    var token: String = "25ef08f625ef08f625ef08f6c2258483fc225ef25ef08f6785af179d1821aaf7d60c04a"
    var userId: Int = 7047946
}
