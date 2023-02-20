//
//  UIImageView.swift
//  wantediOSHenry
//
//  Created by 임우섭 on 2023/02/18.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        self.image = UIImage(systemName: "photo")
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}

