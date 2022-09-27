//
//  SplashScreenVC.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 27.09.2022.
//

import UIKit

class SplashScreenVC: UIViewController {
    private lazy var labelTxt = ""

    private let label: UILabel = {
        let label = BaseFeatureLabel(frame: .zero)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        return label
    }()

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        if Reachability.isConnectedToNetwork() {
            RemoteConfigHelper.shared.displayNewValues { logoText in
                self.remoteValueLoaded(logoText: logoText)
            }
        } else {
            AlertManager.shared.showAlert(title: "Warning".uppercased(), message: "Check Your Internet Connection".uppercased())
        }
    }

    func remoteValueLoaded(logoText: String) {
        DispatchQueue.main.async {
            self.label.text = logoText
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { timer in
                self.navigationController?.pushViewController(HomePageVC(nibName: nil, bundle: nil), animated: true)
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(label)
        label.frame.size = CGSize(width: 100, height: 100)
        label.center = view.center




    }

}
