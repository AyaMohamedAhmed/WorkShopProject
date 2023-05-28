//
//  HeaderSectionDetailsCell.swift
//  WorkShopProject
//
//  Created by marina on 26/05/2023.
//

import UIKit

class HeaderSectionDetailsCell: UITableViewCell {
    
    @IBOutlet weak var mealImage: UIImageView!
    
    @IBOutlet weak var playVideoBtn: UIButton!
    
    @IBOutlet weak var favouriteBtn: UIButton!
    
    @IBOutlet weak var mealName: UILabel!
    
    @IBOutlet weak var mealType: UILabel!
    
    @IBOutlet weak var serviceNum: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func renderUI(){
    
    }
    
    func displauing(){
        playVideoBtn.layer.cornerRadius = 20
        favouriteBtn.layer.cornerRadius = 20
        
    }
    
    @IBAction func playBtn(_ sender: Any) {
    }
    
    @IBAction func favBtn(_ sender: Any) {
    }
    
    
}
