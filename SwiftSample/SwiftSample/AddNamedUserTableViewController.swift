/* Copyright 2018 Urban Airship and Contributors */

import UIKit
import AirshipKit

class AddNamedUserTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet var addNamedUserTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addNamedUserTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        if ((UAirship.namedUser().identifier) != nil) {
            addNamedUserTextField.text = UAirship.namedUser().identifier
        }
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)

        if (!(textField.text?.isEmpty)!){
            UAirship.namedUser().identifier = textField.text
        } else {
            UAirship.namedUser().identifier = nil
        }

        UAirship.push().updateRegistration()

        _ = navigationController?.popViewController(animated: true)

        return true
    }
}
