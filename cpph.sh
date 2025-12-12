#!/bin/bash

# C++ Question Code Extractor Script (Self-Contained)
# All questions and codes are embedded within this script

# Color codes for better UI
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    NC="" # No Color

# Disable colors for JDoodle or other non-terminal environments
if [ "$JDoodle" = "true" ]; then
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    NC=""
fi


# Array of question descriptions
declare -a QUESTIONS=(
    "Create a class Car with data members like brand, model, and price. Write member functions to input and display car details. Use public and private access specifiers properly."
    "Create a class Student that counts how many objects are created using a static variable. Add a constructor and destructor to show when objects are created and destroyed. Include inline functions for setting and displaying student data."
    "Create two classes named Account and Loan. Each class should have one private data member. Account should store the balance, Loan should store the loan amount. Write a function called displayFinancials() that is not a member of either class, but can access and display the private data of both classes using the friend function concept. Also, create a class called Auditor which can access the private data of both Account and Loan using the friend class concept."
    "Create a class Employee with private data members name and salary. Use getter and setter methods to access and modify these values. Demonstrate encapsulation by controlling access to salary (e.g.. prevent setting negative salary)."
    "Create a class Counter with a mutable data member accessCount that is modified inside a const function. Show how mutable allows change even when other members are constant"
    "Create a C++ program for a student database (Name, Roll No, Class, Division) using Constructor, Default & Copy Constructor, Destructor, Static Function, Friend Class, this pointer, Inline Function, and dynamic memory (new/delete)."
    "Create classes Person (name, age), Employee (salary), and Manager (department) to demonstrate single, multilevel, multiple, hierarchical, and hybrid inheritance. Show constructor-destructor order and use appropriate access specifiers."
    "Implement a class Complex which represents the Complex Number data type. Implement the following 1.Constructor (including a default constructor which creates the complex number 0+01) 2.Overloaded operator+ to add two complex numbers. 3.Overloaded operator to multiply two complex numbers. 4.Overloaded << and >> to print and read Complex Numbers."
    "Create classes User, Developer, and Learner, where Developer and Learner inherit from User as virtual base classes. Create a class Trainee that inherits from both Developer and Learner. Override a function display() in each class and call it using a User pointer."
    "Create a class MathOperation with a function to divide two numbers. Handle divide-by-zero using try, catch, and throw. Use nested try-catch blocks, rethrow, and demonstrate use of standard exception classes."
    "Create a class Student with members like name, rollNo, and marks. Write and read objects to and from a binary file using file stream classes. Handle file errors, use file pointers to update a specific record, and detect end-of-file."
    "Create a class Student to write and read student records using binary file handling. Use exception handling to catch invalid marks (e.g., <0 or >100) and handle file 1/0 errors gracefully. Mini Projects (Implement any one)"
    "Create a function template findMax() to return the maximum of values. Create a class template SimpleCalculator<T> to perform addition, subtraction, multiplication, and division for int and float types."
    "Write a C++ program to store and manage a list of Book records (Book ID, Title, Author, Price) using a vector. Implement sorting by price and searching by title using STL algorithms."
    "Design and implement a computer information system in C++ that demonstrates key object-oriented programming principles, especially encapsulation and controlled access to data. The system should use private data member, and provide public getter and setter method to accessor modify amount information. It should also differentiate between mutable and immutable object through specific class designs."
    "Design and implement a Vehicle Management System in C++ that demonstrates various types of inheritance (single, multiple, multilevel, hierarchical, hybrid) along with method overloading, overriding, use of this pointer, abstract classes, and interfaces. The system will allow users to manage different categories of vehicles (e.g., Car, Bike, Truck) and showcase object-oriented design and code reusability."
)

# Array of descriptive filenames for each question
declare -a FILENAMES=(
    "car_class.cpp"
    "student_object_counter.cpp"
    "friend_function_class.cpp"
    "employee_encapsulation.cpp"
    "mutable_counter.cpp"
    "student_database.cpp"
    "inheritance_demo.cpp"
    "complex_number.cpp"
    "virtual_inheritance.cpp"
    "exception_handling.cpp"
    "file_handling.cpp"
    "file_exception_handling.cpp"
    "templates.cpp"
    "stl_vector_books.cpp"
    "computer_info_system.cpp"
    "vehicle_management.cpp"
)

# Function to get code for a specific question
get_code() {
    local question_num=$1
    
    case $question_num in
        1)
            cat << 'EOF'
#include <iostream>
using namespace std;

class Car {
private:
    string brand;
    string model;
    float price;

public:
    void input() {
        cout << "Enter car brand: ";
        cin >> brand;

        cout << "Enter car model: ";
        cin >> model;

        cout << "Enter car price: ";
        cin >> price;
    }

    void display() {
        cout << "\nCar Details:" << endl;
        cout << "Brand: " << brand << endl;
        cout << "Model: " << model << endl;
        cout << "Price: Rs " << price << endl;
    }
};

int main() {
    Car myCar;

    myCar.input();
    myCar.display();

    return 0;
}
EOF
            ;;
        2)
            cat << 'EOF'
#include <iostream>
#include <string>

class Student {
    int roll;
    char name[20];
    static int cnt;

public:
    Student();   // constructor
    ~Student();  // destructor

    void getdata();
    void display();
};

int Student::cnt = 0;   // initialize static variable

Student::Student() {
    cnt++;
    std::cout << "\nNo. of objects: " << cnt;
}

Student::~Student() {
    cnt--;
    std::cout << "\nNo. of objects after destruction: " << cnt;
}

void Student::getdata() {
    std::cout << "\nEnter roll: ";
    std::cin >> roll;
    std::cout << "Enter name: ";
    std::cin >> name;
}

void Student::display() {
    std::cout << "Roll: " << roll << "\nName: " << name << "\n";
}

int main() {
    Student s1;     // object creation
    {
        Student s2, s3;
    }                // s2 and s3 destroyed here

    return 0;
}
EOF
            ;;
        3)
            cat << 'EOF'
#include <iostream>
using namespace std;
class Loan;   // Forward declaration
class Account {
private:
    float balance;
public:
    Account(float b) : balance(b) {}
    friend void displayFinancials(const Account&, const Loan&);
    friend class Auditor;
};
class Loan {
private:
    float loanAmount;
public:
    Loan(float l) : loanAmount(l) {}
    friend void displayFinancials(const Account&, const Loan&);
    friend class Auditor;
};
void displayFinancials(const Account& a, const Loan& l) {
    cout << "\n--- Financial Details (Friend Function) ---\n";
    cout << "Account Balance: " << a.balance << endl;
    cout << "Loan Amount: " << l.loanAmount << endl;
}
class Auditor {
public:
    void audit(const Account& a, const Loan& l) {
        cout << "\n--- Auditor Report (Friend Class) ---\n";
        cout << "Account Balance: " << a.balance << endl;
        cout << "Loan Amount: " << l.loanAmount << endl;
    }
};
int main() {
    Account A(50000);
    Loan L(20000);
    displayFinancials(A, L);
    Auditor auditor;
    auditor.audit(A, L);
    return 0;
}
EOF
            ;;
        4)
            cat << 'EOF'
#include <iostream>
using namespace std;

class Employee {
private:
    string name;
    float salary;

public:
    void setName(string n) {
        name = n;
    }

    void setSalary(float s) {
        if (s < 0) {
            cout << "Invalid salary! Salary cannot be negative." << endl;
            salary = 0; 
        } else {
            salary = s;
        }
    }

    string getName() {
        return name;
    }

    float getSalary() {
        return salary;
    }
};

int main() {
    Employee e;

    e.setName("Aditya");
    e.setSalary(50000);

    cout << "Employee Name: " << e.getName() << endl;
    cout << "Employee Salary: " << e.getSalary() << endl;

    // Trying to set a negative salary
    e.setSalary(-3000);

    return 0;
}
EOF
            ;;
        5)
            cat << 'EOF'
#include <iostream>
using namespace std;

class counter {
    int count = 1;
    mutable int access_counter = 0;

public:

    void tracker() const {
        access_counter++;

        cout << "Function called!!! \n";
        cout << "Static variable : " << count << endl;
        cout << "Mutable variable : " << access_counter << endl;
        cout << "\n";
    }

    void tracker2() {
        access_counter++;
        count++;

        cout << "Function 2 called!!! \n";
        cout << "Static variable : " << count << endl;
        cout << "Mutable variable : " << access_counter << endl;
        cout << "\n";
    }
};

int main() {
    counter c1;
    c1.tracker();
    c1.tracker();
    c1.tracker2();
    c1.tracker2();
    return 0;
}
EOF
            ;;
        6)
            cat << 'EOF'
#include <iostream>
using namespace std;

class Student {
private:
    string name;
    int roll;
    string cls;
    char division;
    static int count;

public:
    // Default constructor
    Student() {
        name = "Unknown";
        roll = 0;
        cls = "N/A";
        division = '-';
        count++;
    }

    // Parameterized constructor
    Student(string name, int roll, string cls, char division) {
        this->name = name;
        this->roll = roll;
        this->cls = cls;
        this->division = division;
        count++;
    }

    // Copy constructor
    Student(const Student &s) {
        name = s.name;
        roll = s.roll;
        cls = s.cls;
        division = s.division;
        count++;
    }

    // Display function
    inline void display() const {
        cout << "\nName : " << name
             << "\nRoll : " << roll
             << "\nClass : " << cls
             << "\nDivision : " << division << endl;
    }

    // Static function
    static int getCount() {
        return count;
    }

    friend class Admin;

    // Destructor
    ~Student() {
        count--;
    }
};

// Static variable initialization
int Student::count = 0;

// Friend class
class Admin {
public:
    void show(Student &s) {
        cout << "\n[Admin Access]";
        cout << "\nName : " << s.name
             << "\nRoll : " << s.roll
             << "\nClass : " << s.cls
             << "\nDivision : " << s.division << endl;
    }
};

int main() {
    Student *s1 = new Student("Shinu", 1, "TYCO", 'A');

    cout << "\n-- Student Details --";
    s1->display();
    cout << "\nTotal Students: " << Student::getCount();

    Student s2 = *s1;
    cout << "\n\n-- Copied Student --";
    s2.display();

    Admin admin;
    admin.show(s2);

    cout << "\nTotal Students: " << Student::getCount();

    delete s1;
    cout << "\n\nAfter Deletion, Total Students: " << Student::getCount();

    return 0;
}
EOF
            ;;
        7)
            cat << 'EOF'
#include <iostream>
using namespace std;

class Person {
protected:
    string name;
    int age;
public:
    Person() {
        cout << "Person Constructor\n";
    }
    ~Person() {
        cout << "Person Destructor\n";
    }
};

class Employee : public Person {
protected:
    float salary;
public:
    Employee() {
        cout << "Employee Constructor\n";
    }
    ~Employee() {
        cout << "Employee Destructor\n";
    }
};

class Manager : public Employee {
protected:
    string department;
public:
    Manager() {
        cout << "Manager Constructor\n";
    }
    ~Manager() {
        cout << "Manager Destructor\n";
    }
};

class Student : public Person {
public:
    Student() {
        cout << "Student Constructor\n";
    }
    ~Student() {
        cout << "Student Destructor\n";
    }
};

class Skills {
public:
    Skills() {
        cout << "Skills Constructor\n";
    }
    ~Skills() {
        cout << "Skills Destructor\n";
    }
};

class Trainer : public Person, public Skills {
public:
    Trainer() {
        cout << "Trainer Constructor\n";
    }
    ~Trainer() {
        cout << "Trainer Destructor\n";
    }
};

int main() {

    cout << "\n--- Manager Object (Multilevel) ---\n";
    Manager m;

    cout << "\n--- Student Object (Hierarchical) ---\n";
    Student s;

    cout << "\n--- Trainer Object (Multiple + Hybrid) ---\n";
    Trainer t;

    return 0;
}
EOF
            ;;
        8)
            cat << 'EOF'
#include <iostream>
using namespace std;

class Complex {
private:
    float real;
    float imag;

public:
    Complex() : real(0), imag(1) {}

    Complex(float r, float i) : real(r), imag(i) {}

    Complex add(const Complex &c) {
        return Complex(real + c.real, imag + c.imag);
    }

    Complex multiply(const Complex &c) {
        return Complex(real*c.real - imag*c.imag,
                       real*c.imag + imag*c.real);
    }

    void read() {
        cout << "Enter real part: ";
        cin >> real;
        cout << "Enter imaginary part: ";
        cin >> imag;
    }

    void display() {
        cout << real << " + " << imag << "i";
    }
};

int main() {
    Complex c1, c2, sum, prod;

    cout << "\n--- Enter first complex number ---\n";
    c1.read();

    cout << "\n--- Enter second complex number ---\n";
    c2.read();

    sum = c1.add(c2);
    prod = c1.multiply(c2);

    cout << "\nSum: ";
    sum.display();

    cout << "\nProduct: ";
    prod.display();

    return 0;
}
EOF
            ;;
        9)
            cat << 'EOF'
#include <iostream>
using namespace std;

class User {
public:
    virtual void display() {
        cout << "User details\n";
    }
    virtual ~User() {} // virtual destructor
};

class Developer : virtual public User {
public:
    void display() override {
        cout << "Developer details\n";
    }
};

class Learner : virtual public User {
public:
    void display() override {
        cout << "Learner details\n";
    }
};

class Trainee : public Developer, public Learner {
public:
    void display() override {
        cout << "Trainee details\n";
    }
};

int main() {
    User* u;
    User user;
    Developer dev;
    Learner learner;
    Trainee trainee;
    
    cout << "--- User ---\n";
    u = &user;
    u->display();
    
    cout << "--- Developer ---\n";
    u = &dev;
    u->display();
    
    cout << "--- Learner ---\n";
    u = &learner;
    u->display();
    
    cout << "--- Trainee ---\n";
    u = &trainee;
    u->display();
    
    return 0;
}
EOF
            ;;
        10)
            cat << 'EOF'
#include <iostream>
using namespace std;

int main() {
    
    double a = 10, b = 0;
    
    try {
        try {
            if (b == 0)
                throw "Division by zero!";  // throwing a C-string
            
            double result = a / b;
            cout << "Result = " << result << endl;
        }
        catch (const char* msg) {
            cout << "Inner catch: " << msg << endl;
            throw;  // rethrow
        }
    }
    catch (const char* msg) {
        cout << "Outer catch: " << msg << endl;
    }
    
    return 0;
}
EOF
            ;;
        11)
            cat << 'EOF'
#include <iostream>
#include <fstream>
using namespace std;

int main() {
    char name[20];
    int rollNo;
    float marks;
    
    cout << "Enter student details to write:\n";
    cout << "Name: "; cin >> name;
    cout << "Roll No: "; cin >> rollNo;
    cout << "Marks: "; cin >> marks;
    
    // Writing to binary file
    ofstream outFile("stud.dat", ios::binary);
    if (!outFile) { cout << "Error opening file for writing!"; return 0; }
    
    outFile.write((char*)&name, sizeof(name));
    outFile.write((char*)&rollNo, sizeof(rollNo));
    outFile.write((char*)&marks, sizeof(marks));
    outFile.close();
    
    // Reading from binary file
    ifstream inFile("stud.dat", ios::binary);
    if (!inFile) { cout << "Error opening file for reading!"; return 0; }
    
    cout << "\n--- Student Record ---\n";
    inFile.read((char*)&name, sizeof(name));
    inFile.read((char*)&rollNo, sizeof(rollNo));
    inFile.read((char*)&marks, sizeof(marks));
    
    cout << "Name: " << name << "\nRoll No: " << rollNo << "\nMarks: " << marks << endl;
    
    if (inFile.eof())
        cout << "End of file reached.\n";
    
    inFile.close();
    
    // Updating the record
    cout << "\nUpdate the record:\n";
    cout << "New Name: "; cin >> name;
    cout << "New Roll No: "; cin >> rollNo;
    cout << "New Marks: "; cin >> marks;
    
    fstream updateFile("stud.dat", ios::binary | ios::in | ios::out);
    if (!updateFile) { cout << "Error opening file for update!"; return 0; }
    
    updateFile.seekp(0, ios::beg); // Move pointer to beginning
    updateFile.write((char*)&name, sizeof(name));
    updateFile.write((char*)&rollNo, sizeof(rollNo));
    updateFile.write((char*)&marks, sizeof(marks));
    
    cout << "Record updated successfully!\n";
    updateFile.close();
    
    return 0;
}
EOF
            ;;
        12)
            cat << 'EOF'
#include <iostream>
#include <fstream>
#include <stdexcept>
using namespace std;

int main() {
    char name[20];
    int rollNo;
    float marks;
    
    // Writing student record with exception handling
    try {
        cout << "Enter name: ";
        cin >> name;
        cout << "Enter roll number: ";
        cin >> rollNo;
        cout << "Enter marks (0-100): ";
        cin >> marks;
        
        if (marks < 0 || marks > 100)
            throw out_of_range("Invalid marks! Must be between 0 and 100.");
        
        ofstream outFile("students.dat", ios::binary);
        if (!outFile)
            throw runtime_error("Error opening file for writing!");
        
        outFile.write((char*)&name, sizeof(name));
        outFile.write((char*)&rollNo, sizeof(rollNo));
        outFile.write((char*)&marks, sizeof(marks));
        outFile.close();
        
        cout << "Record saved successfully!\n";
    }
    catch (exception &e) {
        cout << "Error: " << e.what() << endl;
        return 0;
    }
    
    // Reading student record with exception handling
    try {
        ifstream inFile("students.dat", ios::binary);
        if (!inFile)
            throw runtime_error("Error opening file for reading!");
        
        cout << "\n--- Student Record ---\n";
        inFile.read((char*)&name, sizeof(name));
        inFile.read((char*)&rollNo, sizeof(rollNo));
        inFile.read((char*)&marks, sizeof(marks));
        inFile.close();
        
        cout << "Name: " << name << "\nRoll No: " << rollNo << "\nMarks: " << marks << endl;
    }
    catch (exception &e) {
        cout << "Error: " << e.what() << endl;
    }
    
    return 0;
}
EOF
            ;;
        13)
            cat << 'EOF'
#include <iostream>
using namespace std;

// Function Template
template <typename T>
T findMax(T a, T b) {
    return (a > b) ? a : b;
}

// Class Template
template <class T>
class SimpleCalculator {
private:
    T num1, num2;

public:
    SimpleCalculator(T a, T b) {
        num1 = a;
        num2 = b;
    }
    
    T add() { return num1 + num2; }
    T sub() { return num1 - num2; }
    T mul() { return num1 * num2; }
    T divi() { return num1 / num2; }
};

int main() {
    // Testing Function Template
    cout << "FindMax(): " << findMax(10, 20) << endl;
    cout << "\n";
    
    // Testing Class Template with int
    SimpleCalculator<int> calc(10, 20);
    cout << "Integer Calculator input: 10, 20" << endl;
    cout << "SimpleCalculator Addition: " << calc.add() << endl;
    cout << "SimpleCalculator Subtraction: " << calc.sub() << endl;
    cout << "SimpleCalculator Multiplication: " << calc.mul() << endl;
    cout << "SimpleCalculator Division: " << calc.divi() << endl;
    cout << "\n";
    
    // Testing Class Template with float
    SimpleCalculator<float> calc1(1.5, 2.5);
    cout << "Float Calculator input: 1.5, 2.5" << endl;
    cout << "SimpleCalculator Addition: " << calc1.add() << endl;
    cout << "SimpleCalculator Subtraction: " << calc1.sub() << endl;
    cout << "SimpleCalculator Multiplication: " << calc1.mul() << endl;
    cout << "SimpleCalculator Division: " << calc1.divi() << endl;
    
    return 0;
}
EOF
            ;;
        14)
            cat << 'EOF'
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

class Book {
public:
    int id;
    string title;
    string author;
    float price;
    
    void setBook(int i, string t, string a, float p) {
        id = i;
        title = t;
        author = a;
        price = p;
    }
    
    void display() const {
        cout << "ID: " << id
             << " | Title: " << title
             << " | Author: " << author
             << " | Price: " << price << endl;
    }
};

int main() {
    vector<Book> books(3);
    
    books[0].setBook(101, "C++", "Bjarne", 450);
    books[1].setBook(102, "Clean Code", "Martin", 550);
    books[2].setBook(103, "STL", "Josuttis", 350);
    
    cout << "\nOriginal List:\n";
    for (auto &b : books) b.display();
    
    // Sort by price using lambda function
    sort(books.begin(), books.end(),
         [](const Book &a, const Book &b) {
             return a.price < b.price;
         });
    
    cout << "\nSorted by Price:\n";
    for (auto &b : books) b.display();
    
    // Search for a book by title
    string searchTitle = "Clean Code";
    auto it = find_if(books.begin(), books.end(),
                      [&](const Book &b) {
                          return b.title == searchTitle;
                      });
    
    cout << "\nSearch Result:\n";
    if (it != books.end())
        it->display();
    else
        cout << "Book not found!\n";
    
    return 0;
}
EOF
            ;;
        15)
            cat << 'EOF'
#include <iostream>
using namespace std;

class PC {
public:
    int pcNumber = 1;
    mutable int storage;
    mutable int speed;
    
    void get1() const {
        cout << "PC Number: " << pcNumber << endl;
        cout << "Storage (GB): " << endl;
        cin >> storage;
        cout << "Speed (GHz): " << endl;
        cin >> speed;
    }
    
    void get2() {
        pcNumber++;
        cout << "\nPC Number Incremented " << endl;
        cout << "Storage (GB): " << endl;
        cin >> storage;
        cout << "Speed (GHz): " << endl;
        cin >> speed;
    }
    
    void set() {
        cout << "PC Number: " << pcNumber << endl;
        cout << "Storage: " << storage << " GB" << endl;
        cout << "Speed: " << speed << " GHz" << endl;
    }
};

int main() {
    PC pc;
    pc.get1();
    cout << "\nPC Details:" << endl;
    pc.set();
    cout << "Change details " << endl;
    pc.get2();
    cout << "\nPC Details:" << endl;
    pc.set();
    return 0;
}
EOF
            ;;
        16)
            cat << 'EOF'
#include <iostream>
using namespace std;

class Vehicle {
protected:
    string brand;
public:
    Vehicle(string b) { this->brand = b; }
    virtual void displayType() {
        cout << "Generic Vehicle\n";
    }
};

class Serviceable {
public:
    virtual void service() = 0;  // Pure virtual function
};

class Bike : public Vehicle {
public:
    Bike(string b) : Vehicle(b) {}
    
    void displayType() override {
        cout << "This is a Bike\n";
    }
};

class ElectricBike : public Bike, public Serviceable {  // Hybrid form
public:
    ElectricBike(string b) : Bike(b) {}
    
    void displayType() override {
        cout << "This is an Electric Bike\n";
    }
    
    void service() override {
        cout << "Electric Bike sent for service\n";
    }
};

int main() {
    Vehicle* v;
    ElectricBike eb("Ola");
    v = &eb;
    v->displayType();
    eb.service();
    return 0;
}
EOF
            ;;
        *)
            return 1
            ;;
    esac
    return 0
}

# Function to display the header
display_header() {
    clear
    echo -e "${BLUE}=================================================${NC}"
    echo -e "${BLUE}    C++ PROGRAMMING QUESTIONS - CODE EXTRACTOR${NC}"
    echo -e "${BLUE}=================================================${NC}"
    echo ""
}

# Function to display all questions
display_questions() {
    echo -e "${GREEN}Available Questions:${NC}"
    echo ""
    
    for i in "${!QUESTIONS[@]}"; do
        local num=$((i + 1))
        echo -e "${YELLOW}$num${NC}: ${QUESTIONS[$i]}"
        echo ""
    done
    
    echo -e "${RED}0: Exit${NC}"
    echo ""
}

# Function to get valid question number from user
get_question_choice() {
    local choice
    while true; do
        printf "${BLUE}Enter question number (0 to exit): ${NC}"
        read choice
        
        # Check if input is a number
        if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
            echo -e "${RED}Invalid input! Please enter a number.${NC}"
            echo ""
            continue
        fi
        
        # Check if choice is 0 (exit)
        if [ "$choice" -eq 0 ]; then
            return 0
        fi
        
        # Check if choice is in valid range (1-16)
        if [ "$choice" -ge 1 ] && [ "$choice" -le 16 ]; then
            return 0
        else
            echo -e "${RED}Invalid question number! Please enter a number between 1 and 16.${NC}"
            echo ""
        fi
    done
}

# Function to create the code file
create_code_file() {
    local question_num=$1
    local filename=$2
    
    if get_code "$question_num" > "$filename"; then
        return 0
    else
        return 1
    fi
}

# Function to ask if user wants to continue
ask_continue() {
    local response
    echo ""
    printf "${BLUE}Do you want to extract another question? (y/n): ${NC}"
    read response
    
    if [[ "$response" =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

# Main program
main() {
    while true
    do
        # Display header and questions
        display_header
        display_questions
        
        # Get user choice directly
        while true; do
            printf "${BLUE}Enter question number (0 to exit): ${NC}"
            read choice
            
            # Check if input is a number
            if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
                echo -e "${RED}Invalid input! Please enter a number.${NC}"
                echo ""
                continue
            fi
            
            # Check if choice is 0 (exit)
            if [ "$choice" -eq 0 ]; then
                echo ""
                echo -e "${GREEN}Thank you for using the C++ Code Extractor!${NC}"
                echo ""
                exit 0
            fi
            
            # Check if choice is in valid range (1-16)
            if [ "$choice" -ge 1 ] && [ "$choice" -le 16 ]; then
                break
            else
                echo -e "${RED}Invalid question number! Please enter a number between 1 and 16.${NC}"
                echo ""
            fi
        done
        
        # Get the filename for this question
        filename="${FILENAMES[$((choice-1))]}"
        
        # Extract code
        echo ""
        echo -e "${YELLOW}Extracting code for Question $choice...${NC}"
        
        if create_code_file "$choice" "$filename"; then
            echo -e "${GREEN}Success!${NC} Code has been saved to: ${YELLOW}$filename${NC}"
            echo ""
            echo -e "${GREEN}File created in current directory: $(pwd)/$filename${NC}"
        else
            echo -e "${RED}Error: Could not extract code for Question $choice${NC}"
        fi
        
        # Ask if user wants to continue
        if ! ask_continue; then
            echo ""
            echo -e "${GREEN}Thank you for using the C++ Code Extractor!${NC}"
            echo ""
            exit 0
        fi
    done
}

# Run the main program
main
