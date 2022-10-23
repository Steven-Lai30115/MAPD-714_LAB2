
import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePickerControl: UIDatePicker!
    @IBOutlet weak var selectTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        datePickerControl.setDate(date as Date, animated: true)
        
        print("Date Picker Controller")
    }

    
    @IBAction func selectButton_Pressed(_ sender: UIButton) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        selectTime.text = dateFormatter.string(from: datePickerControl.date)
    }
    
}

