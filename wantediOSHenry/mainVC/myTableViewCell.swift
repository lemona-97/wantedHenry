//
//  myTableViewCell.swift
//  wantediOSHenry
//
//  Created by 임우섭 on 2023/02/18.
//

import UIKit
import SnapKit

class myTableViewCell: UITableViewCell {
    
    let cellImgView = UIImageView()
    let progressBar = UIProgressView()
    let imageLoadBtn = UIButton()
    
    var cellURL = URL(string: "")
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: .value1, reuseIdentifier: "myTableViewCell")
        setAttribute()
        addView()
        setLayout()
        addBtnTargetFunc()
    }
    
    private func setAttribute() {
        cellImgView.do {
            $0.image = UIImage(systemName: "photo")!
            $0.contentMode = .scaleAspectFill
        }
        progressBar.do {
            $0.progress = 0.5
        }
        imageLoadBtn.do {
            $0.setTitle("Load", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner])
        }
    }
    private func addView() {
        self.contentView.addSubviews([cellImgView, progressBar, imageLoadBtn])
    }
    private func setLayout() {
        cellImgView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.width.equalTo(100)
        }
        progressBar.snp.makeConstraints {
            $0.width.equalTo(150)
            $0.height.equalTo(5)
            $0.leading.equalTo(cellImgView.snp.trailing).offset(20)
            $0.centerY.equalTo(cellImgView)
        }
        imageLoadBtn.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.leading.equalTo(progressBar.snp.trailing)
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(progressBar)
        }
        
    }
    private func addBtnTargetFunc() {
        imageLoadBtn.addTarget(self, action: #selector(loadImg), for: .touchUpInside)
    }
    @objc
    private func loadImg() {
        
        cellImgView.load(url: cellURL!)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
