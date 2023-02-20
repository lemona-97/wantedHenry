//
//  ViewController.swift
//  wantediOSHenry
//
//  Created by 임우섭 on 2023/02/18.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    
    let myTableview = UITableView()
    var tableViewImages = [UIImageView()]
    let loadAllImgBtn = UIButton()
    
    let imageURLs = [URL(string: "https://cdn.pixabay.com/photo/2023/01/23/09/26/cat-7738210_960_720.jpg"),
                     URL(string: "https://cdn.pixabay.com/photo/2022/11/20/09/06/night-view-7603847_960_720.jpg"),
                     URL(string: "https://cdn.pixabay.com/photo/2020/05/19/10/05/opel-5190050_960_720.jpg"),
                     URL(string: "https://cdn.pixabay.com/photo/2017/09/07/08/54/money-2724241_960_720.jpg"),
                     URL(string: "https://cdn.pixabay.com/photo/2014/10/23/10/10/dollars-499481_960_720.jpg")
                    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
        addView()
        setLayout()
        setDelegate()
        addTargetFunc()
    }
    private func setAttribute() {
        view.backgroundColor = .white
        myTableview.do {
            $0.backgroundColor = .clear
        }
        loadAllImgBtn.do {
            $0.setTitle("Load All Images", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner])
        }
    }
    private func addView() {
        self.view.addSubviews([myTableview,loadAllImgBtn])
        
    }
    private func setLayout() {
        myTableview.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-70)
        }
        loadAllImgBtn.snp.makeConstraints {
            $0.top.equalTo(myTableview.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    private func setDelegate() {
        myTableview.delegate = self
        myTableview.dataSource = self
        myTableview.register(myTableViewCell.self, forCellReuseIdentifier: "myTableViewCell")
    }

    private func addTargetFunc() {
        loadAllImgBtn.addTarget(self, action: #selector(loadAllImage), for: .touchUpInside)
        
    }
    @objc
    private func loadAllImage() {
        for i in 0..<imageURLs.count {
            tableViewImages[i+1].load(url: imageURLs[i]!)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageURLs.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as? myTableViewCell else { return UITableViewCell() }
        print(indexPath)
        cell.cellURL = imageURLs[indexPath.row]!
        tableViewImages.append(cell.cellImgView)
        return cell
    }
    
    
}
