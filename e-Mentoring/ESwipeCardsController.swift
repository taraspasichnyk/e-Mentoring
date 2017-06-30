//
//  ESwipeCardsController.swift
//  e-Mentoring
//
//  Created by Taras Pasichnyk on 6/30/17.
//  Copyright © 2017 Taras Pasichnyk. All rights reserved.
//

import UIKit
import Koloda

class ESwipeCardsController: UIViewController {

    @IBOutlet weak var swipeCardView: KolodaView!
    
    let images = [
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek"),
        UIImage(named: "kindgeek")
    ]
    let eleksUrl = URL(string: "https://eleks.com")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        swipeCardView.dataSource = self
        swipeCardView.delegate = self
    }
    
}

extension ESwipeCardsController: KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return images.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = UIImageView()
        view.image = images[index]
        view.backgroundColor = UIColor.green
        view.layer.cornerRadius = 30.0
        view.layer.masksToBounds = true
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 30.0
        view.layer.masksToBounds = true
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.blue.cgColor
        return view as? OverlayView
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
}

extension ESwipeCardsController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
        
    }
    
    func koloda(koloda: KolodaView, didSelectCardAt index: Int) {
        UIApplication.shared.open(eleksUrl, options: [:])
    }
}



