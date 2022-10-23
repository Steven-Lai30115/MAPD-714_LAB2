

import UIKit


enum ColourChannel: Int {
    case Red = 0, Blue, Green, Alpha
}



class MultiComponentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var selectedLabel: UILabel!
    
    let Red = ColourChannel.Red
    let Blue = ColourChannel.Blue
    let Green = ColourChannel.Green
    let Alpha = ColourChannel.Alpha
    
    var valueArray : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("multi component")
        BuildValueArray()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(256, inComponent: Red.rawValue, animated: true)
        pickerView.selectRow(256, inComponent: Blue.rawValue, animated: true)
        pickerView.selectRow(256, inComponent: Green.rawValue, animated: true)
        
      
        
    }
    
    func BuildValueArray(){
        for index in stride(from: 255, through: 0, by: -1) {
            valueArray.append(String(index))
        }
    }
    
    
    
    @IBAction func selectButton_Pressed(_ sender: UIButton) {
        let RedChannelIndex = pickerView.selectedRow(inComponent: Red.rawValue)
        let BlueChannelIndex = pickerView.selectedRow(inComponent: Blue.rawValue)
        let GreenChannelIndex = pickerView.selectedRow(inComponent: Green.rawValue)
        
        let redChannel = CGFloat((valueArray[RedChannelIndex] as NSString).floatValue) / 255.0
        let greenChannel = CGFloat((valueArray[GreenChannelIndex] as NSString).floatValue) / 255.0
        let blueChannel = CGFloat((valueArray[BlueChannelIndex] as NSString).floatValue) / 255.0
        
//
        let picker = UIColorPickerViewController()
        picker.selectedColor = UIColor(red: redChannel, green: greenChannel, blue: blueChannel, alpha: 1.0)

        self.present(picker, animated: true)
        
        selectedLabel.text = "R : \(redChannel) G : \(greenChannel)  B : \(blueChannel)"
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return 256
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return valueArray[row]
    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        <#code#>
//    }
}
