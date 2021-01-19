import UIKit

class Contact {
    var name: String
    var phone: String
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}

class ViewController: UITableViewController {
    
    var contacts = [Contact]()
    var sortedContacts = [Contact]()
    
    var contactWithSections = [[Contact]]()
    var dictionaryContacts = [String : [Contact] ]()
    
    let person1 = Contact(name: "Tomas", phone: "+37069090090")
    let person2 = Contact(name: "Antanas", phone: "+37067812345")
    let person3 = Contact(name: "Zigmas", phone: "+37089094695")
    let person4 = Contact(name: "Zara", phone: "+37089094695")
    let person5 = Contact(name: "Apple", phone: "+3745342345")
    let person6 = Contact(name: "Titas", phone: "+370645690090")
    
    override func viewDidLoad() {
        contacts.append(person1)
        contacts.append(person2)
        contacts.append(person3)
        contacts.append(person4)
        contacts.append(person5)
        contacts.append(person6)
        
        sortedContacts = contacts.sorted { $0.name < $1.name }
        
        
        for contact in sortedContacts {
            if let firstLetter = contact.name.first {
                dictionaryContacts[String(firstLetter)] = [contact]
            }
        }
        print(dictionaryContacts)
        
        contactWithSections = [[person1, person2],
                               [person3, person4],
                               [person5, person6]]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contactWithSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactWithSections[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell",
                                                 for: indexPath) // Cell registered in the Main.storyboard

        cell.textLabel?.text = contactWithSections[indexPath.section][indexPath.row].name
        cell.detailTextLabel?.text = contactWithSections[indexPath.section][indexPath.row].phone

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Header"
    }
}
