class Company {
    let name: String
    var employees: [Employee] = []

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Company \(name) is being deinitialized")
    }
}

class Employee {
    let name: String
    weak var company: Company?  // Weak reference to avoid retain cycle

    init(name: String, company: Company?) {
        self.name = name
        self.company = company
    }

    deinit {
        print("Employee \(name) is being deinitialized")
    }
}

// Creating instances
var apple: Company? = Company(name: "Apple")
var employee1: Employee? = Employee(name: "John Doe", company: apple)
var employee2: Employee? = Employee(name: "Jane Smith", company: apple)

apple?.employees.append(employee1!)
apple?.employees.append(employee2!)

// Breaking references
employee1 = nil  // This will not deallocate the Employee instance because apple still holds a strong reference

// Setting apple to nil
apple = nil  // This will deallocate the Company and all its Employees
employee2 = nil
