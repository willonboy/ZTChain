# ZTChain
ZTChain is a lightweight library designed to facilitate chaining syntax in Swift, making your code more readable and expressive.

This is currently the only solution that supports chained assignments for all Objective-C object properties.

## Features 

### 1. **Chainable Syntax**
- Allows for concise and readable code by chaining multiple method calls.
- Example: `view.zt.backgroundColor(.red).cornerRadius(10).borderWidth(2)`

### 2. **Dynamic Member Lookup**
- Utilizes Swift’s `@dynamicMemberLookup` to provide a flexible and clean API.
- Example: `view.zt.title("Welcome").subtitle("Hello World!")`

### 3. **Type-Safe Key Paths**
- Uses Swift’s key paths to ensure type safety when accessing properties.

### 4. **Compatibility with UIKit**
- Extends commonly used UIKit components like `UIView`, `UILabel`, `UIButton`, etc.
- Example: `button.zt.title("Click Me").backgroundColor(.blue)`

### 5. **Custom Wrappers**
- Allows for easy creation of custom wrappers for any class or struct.
- Example: `MyCustomView().zt.customStyle`

### 6. **Fluent Interface Design**
- Provides a fluent interface design pattern for improved code readability and maintainability.
- Example: `textField.zt.placeholder("Enter name").textColor(.gray)`

### 7. **Extendable**
- Easily extendable to support additional custom styles and properties.
- Example: `extension ZTWrapper where Subject: UIButton { ... }`

### 8. **Supports iOS 11**
- Compatible with iOS 11 and later versions.

### 9. **Supports Xcode Build Checks**
- Integrates seamlessly with Xcode, ensuring build checks and validation.

### 10. **Supports Xcode Editor Code Suggestions and Autocompletion**
- Provides full support for code suggestions and autocompletion in Xcode editor.

### 11. **Lightweight and Compact**
- The entire library is contained within a single file, making it easy to integrate and manage.

### 12. **Seamless Integration with Third-Party Libraries**
- Easily integrates with third-party libraries for extending UIKit properties.


## Installation

### Swift Package Manager

To integrate using Apple's Swift Package Manager, add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/willonboy/ZTChain.git", .upToNextMajor(from: "2.0.0"))
]
```

## Usage

### Basic Example 

```swift
import UIKit
import ZTChain


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
    
    
// call function             
self.window = UIWindow()
    .zt
    .frame(UIScreen.main.bounds) 
    .backgroundColor(.white)
    .rootViewController(UINavigationController(rootViewController: ViewController()))
    .call {
        $0.makeKeyAndVisible()
    }
    .build()
```

## License 

This project is licensed under the AGPLv3.
