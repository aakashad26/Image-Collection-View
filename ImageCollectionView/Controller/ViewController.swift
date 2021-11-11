//
//  ViewController.swift
//  ImageCollectionView
//
//  Created by Aakash Adhikari on 5/4/20.
//  Copyright © 2020 Aakash Adhikari. All rights reserved.
//

import UIKit
import Alamofire
import DeviceGuru


class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imagesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        
        fetchImages()
        
        print()
        
    }
    
    func fetchImages(){
        
        AF.request("http://www.kaleidosblog.com/tutorial/get_images.php", method: .get)
        .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    // if let result = response.result.value {
                    let response = value as! [String]
                    print(response)
                    self.imagesArray = response
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
        
                    print(response)
                case .failure(let error):
                    print(error)
                    
                }
        }
        
    }
    
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            if let imageURL = URL(string: imagesArray[indexPath.row]){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.imgView.image = image
                            cell.imgView.layer.cornerRadius = 5.0
                            cell.superview?.backgroundColor = .blue
                            cell.imgView.superview?.backgroundColor = .red
                            cell.layer.cornerRadius = 20
                        }
                    }
                }
            }
            
            return cell
        }
        
        return UICollectionViewCell()
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Selected Image: \(imagesArray[indexPath.row])")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 40.0, bottom: 10.0, right: 40.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let deviceGuru = DeviceGuru()
        let deviceName = deviceGuru.hardware()
        let deviceCode = deviceGuru.platform()
        print("\(deviceName) - \(deviceCode)")
        
        if(deviceGuru.hardwareDescription() == "iPhone 12 Pro Max")
        {
            let width = collectionView.frame.size.width / 3
            let height = collectionView.frame.size.height / 6

            print(width,height)

            return CGSize(width: width, height: height)
        }
        else if (deviceGuru.hardwareDescription() == "iPhone 12")
        {
            let width = collectionView.frame.size.width / 2
            let height = collectionView.frame.size.height / 4
//
//            print(width,height)
//
            return CGSize(width: width, height: height)
        }
        else
        {
            return CGSize(width: 200.0, height: 200.0)
        }
        
    }
    

    
}

