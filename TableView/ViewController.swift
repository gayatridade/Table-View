//
//  ViewController.swift
//  TableView
//
//  Created by Gayatri Dade on 9/6/24.
//

import UIKit

class ChatCell: UITableViewCell {
        
    @IBOutlet weak var myChatName: UILabel!
    @IBOutlet weak var myChatPrice: UILabel!
    @IBOutlet weak var myChatDescp: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var mycustom: UILabel!
    @IBOutlet weak var myButton: UIButton!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var myTableview: UITableView!
        
    var myChatName = ["PaniPuri", "Bhel Puri", "Dahi Puri", "Samosa Chat", "Pav Bhaji", "Vada Pav", "Cutlett", "Mirchi", "Irani Chai", "Fresh Juices", "Ice Creams"]
    var myChatPrice = ["$5.99", "$6.99", "$6.99", "$7.49", "$10.99", "$6.49", "$7.49", "$4.49", "$1", "$2.99", "$3.49"]
    var myChatDescp = ["1Plate 10pcs crispy, hollow, fried dough balls (puri) stuffed with b white peas curry (also known as ragda) together with spicy tangy water and a sweet chutney.",
        "Crispy Puffed rice tossed with sweet chutneys, topped with sev",
        "Crispy fried flour discs are topped with flavorful condiments, veggies, herbs, ground spices and more",
        "Tangy, spicy Samosa Chaat! Spicy chole (chickpeas) are served with samosa and dollops of yogurt and chutney",
        "Mashed spiced vegetables; served with a side of cotton-like soft, buttery dinner rolls, crunchy onions, herby fresh coriander and tangy lemon. ",
        "Vada Pav is a savory and spicy soft fluffy buns, stuffed with a fried batter coated potato dumpling fritter called Batata Vada and laced with spicy and sweet chutneys. ",
        "Crisp, savory, tender patties made with a mix of hearty veggies, savory spices, fresh herbs and crispy breadcrumbs",
        "Fried snack made with gram flour, spices, and green chillies",
        "Flavored hot beverage recipe made with tea powder and a uniquely cooked blend of spices",
        "Bringing you a fresh selection of delicious, nutrient-rich, plant-based juices",
        "Ice cream is a frozen dessert typically made from milk or cream that has been flavoured with a sweetener"]
    var myImage = [ #imageLiteral(resourceName: "Panipuri"), #imageLiteral(resourceName: "Bhelpuri"), #imageLiteral(resourceName: "Dahipuri"), #imageLiteral(resourceName: "Samosachat"), #imageLiteral(resourceName: "PavBhaji"), #imageLiteral(resourceName: "vada-pav"), #imageLiteral(resourceName: "Cutlett"), #imageLiteral(resourceName: "mirchi"), #imageLiteral(resourceName: "Iranichai"), #imageLiteral(resourceName: "Juices"), #imageLiteral(resourceName: "iceCream") ]
    var myCustom = "Customizable"
    var myButton = "ADD"
                                                                                                                
    override func viewDidLoad() {
        super.viewDidLoad()
            
        myTableview.delegate = self
        myTableview.dataSource = self
            // Do any additional setup after loading the view.
        }
    @objc func buttonTapped(_ sender: UIButton) {
        // Access the tag of the button to identify which row's button was pressed
        let rowIndex = sender.tag
        
        // You can now use the rowIndex to identify the item related to this button
        let selectedItem = myChatName[rowIndex]
        print("Button tapped in row \(rowIndex), for item: \(selectedItem)")
        
        // Perform any action based on the selected item, such as adding to cart, etc.
    }

        
    @IBAction func myButton(_ sender: UIButton) {
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            
            return 50.0
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  myChatName.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = myTableview.dequeueReusableCell(withIdentifier: "Chat", for: indexPath) as! ChatCell
            cell.myImage.image = myImage[indexPath.row]
            cell.myChatPrice.text = myChatPrice[indexPath.row]
            cell.myChatName.text = myChatName[indexPath.row]
            cell.myChatDescp.text = myChatDescp[indexPath.row]
            cell.mycustom.text = myCustom
            cell.myButton.tag = indexPath.row
            cell.myButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
           // cell.myImage.layer.cornerRadius = cell.myImage.frame.size.width/2
            cell.myImage.layer.masksToBounds = true
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            print("My Section is \(indexPath), My Row is \(indexPath)")
        }
    }




