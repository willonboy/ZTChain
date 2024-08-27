//
//  ViewController.swift
//  ZTChainDemo
//
//  Created by trojan on 2024/6/4.
//

import UIKit

struct Person: ZTWrapperCompatible {
    var name: String
    var age: Int
    var email: String
    
    init(name: String = "", age: Int = 0, email: String = "") {
        self.name = name
        self.age = age
        self.email = email
    }
}

class Car: NSObject {
    var brand: String
    var model: String
    var year: Int

    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tipsLbl = UILabel().zt
            .frame(CGRect(x: 20, y: 200, width: 350, height: 100))
            .textAlignment(.center)
            .font(.boldSystemFont(ofSize: 18))
            .textColor(.systemPink)
            .numberOfLines(10)
            .lineBreakMode(.byWordWrapping)
            .backgroundColor(.systemGray)
            .text("ZTChain is a lightweight library designed to facilitate chaining syntax in Swift, making your code more readable and expressive.")
            .build()
        
        self.view.addSubview(tipsLbl);
        
        self.zt.title("test").build()
        
        test()
    }
    
    func test() -> Void {
        // 使用链式语法创建并设置 Person 实例
        let person = Person()
            .zt
            .name("Jane Doe")
            .age(28)
            .email("jane.doe@example.com")
            .build()

        print("Name: \(person.name), Age: \(person.age), Email: \(person.email)")

        // 使用链式语法创建并设置 Car 实例
        let car = Car(brand: "Toyota", model: "Camry", year: 2020)
            .zt
            .brand("Honda")
            .model("Civic")
            .year(2021)
            .build()

        print("Brand: \(car.brand), Model: \(car.model), Year: \(car.year)")
    }
    
}

