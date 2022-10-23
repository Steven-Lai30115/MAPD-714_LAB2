
import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePickerControl: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        datePickerControl.setDate(date as Date, animated: true)
        
        print("Date Picker Controller")
    }

    
    @IBAction func selectButton_Pressed(_ sender: UIButton) {
        print(datePickerControl.date)
    }
    
}

