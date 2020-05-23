//
//  ViewController.swift
//  HWS-Classic-Project04-EasyBrowser
//
//  Created by Glenn Drescher on 22/05/2020.
//  Copyright © 2020 Glenn Drescher. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let url = URL(string: "https://www.google.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page ...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Google.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Samsung.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Tesla.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Microsoft.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancle", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        print(url.absoluteString)
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }


}

