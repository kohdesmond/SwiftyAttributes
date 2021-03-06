# SwiftyAttributes

#### *Swift extensions that make it a breeze to work with attributed strings.*

![Swift Version](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftyAttributes.svg)](https://img.shields.io/cocoapods/v/SwiftyAttributes.svg)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyAttributes.svg?style=flat)](http://cocoapods.org/pods/SwiftyAttributes)
[![Travis CI](https://travis-ci.org/eddiekaiger/SwiftyAttributes.svg?branch=master)](https://travis-ci.org/eddiekaiger/SwiftyAttributes.svg?branch=master)
[![codecov.io](http://codecov.io/github/eddiekaiger/SwiftyAttributes/coverage.svg?branch=master)](http://codecov.io/github/eddiekaiger/SwiftyAttributes/coverage.svg?branch=master)

---

The **original** way to create an attributed string in Swift:

````swift
let attributes: [String: Any] = [
    NSForegroundColorAttributeName: UIColor.blue, 
    NSUnderlineStyleAttributeName:  NSNumber(value: NSUnderlineStyle.styleSingle.rawValue)
]
let fancyString = NSAttributedString(string: "Hello World!", attributes: attributes) 
````

With **SwiftyAttributes**, you can write the same thing like this:

````swift
let fancyString = "Hello World!".withTextColor(.blue).withUnderlineStyle(.styleSingle)
````

Alternatively, `SwiftyAttributes` provides an `Attribute` enum:
````swift
let fancyString = "Hello World!".withAttributes([
    .backgroundColor(.magenta),
    .strokeColor(.orange),
    .strokeWidth(1),
    .baselineOffset(5.2)
])
````

You can also easily combine attributed strings using a plus sign:

````swift
let fancyString = "Hello".withFont(.systemFont(ofSize: 12)) + " World!".withFont(.systemFont(ofSize: 18))
````

**SwiftyAttributes** Has support for *every* attribute that can be used in iOS.

# Requirements

* iOS 8.0+

# Installation

### With CocoaPods

#### For **Swift 3**:

`pod 'SwiftyAttributes'`

> For **Swift 2.3**:

> `pod 'SwiftyAttributes', '1.1'`

> If using Xcode 8, you may need to add this to end of your Podfile:

> ```swift
> post_install do |installer|
>     installer.pods_project.targets.each do |target| 
>         target.build_configurations.each do |config| 
>             config.build_settings["SWIFT_VERSION"] = "2.3"
>         end
>     end
> end
> ```

### With Carthage

#### For **Swift 3**:

`github "eddiekaiger/SwiftyAttributes"`

> For **Swift 2.3**:

> `github "eddiekaiger/SwiftyAttributes" == 1.1.1`

# Usage

Initializing attributed strings in `SwiftyAttributes` can be done several ways:

- Using the `with[Attribute]` extensions:
    ````swift
    "Hello World".withUnderlineColor(.red).withUnderlineStyle(.styleDouble)
    ````

- Using the `Attribute` enum extensions:
    ````swift
    "Hello World".withAttributes([.underlineColor(.red), underlineStyle(.styleDouble)])
    ````

- Using the `Attribute` enum in an initializer:
    ````swift
    NSAttributedString(string: "Hello World", attributes: [.kern(5), .backgroundColor(.gray)])
    ````
    
You can retrieve the attribute at a specific location using an attribute name from the `Attribute.Name` enum:
````swift
let attr: Attribute? = myAttributedString.attribute(.shadow, at: 5)
````

Several API methods are provided to use these new enums as well as Swift's `Range` type instead of `NSRange`. Some of the method signatures include:

````swift
extension NSMutableAttributedString {
    func addAttributes(_ attributes: [Attribute], range: Range<Int>)
    func addAttributes(_ attributes: [Attribute], range: NSRange)
    func setAttributes(_ attributes: [Attribute], range: Range<Int>)
    func setAttributes(_ attributes: [Attribute], range: NSRange)
    func replaceCharacters(in range: Range<Int>, with str: String)
    func replaceCharacters(in range: Range<Int>, with attrString: NSAttributedString)
    func deleteCharacters(in range: Range<Int>)
    func removeAttribute(_ name: Attribute.Name, range: Range<Int>)
}

extension NSAttributedString {
    convenience init(string str: String, attributes: [Attribute])
    func withAttributes(_ attributes: [Attribute]) -> NSMutableAttributedString
    func withAttribute(_ attribute: Attribute) -> NSMutableAttributedString
    func attributedSubstring(from range: Range<Int>) -> NSAttributedString
    func attribute(_ attrName: Attribute.Name, at location: Int, effectiveRange range: NSRangePointer? = nil) -> Attribute?
}

extension String {
    func withAttributes(_ attributes: [Attribute]) -> NSMutableAttributedString
    func withAttribute(_ attribute: Attribute) -> NSMutableAttributedString
}
````


# Goals

The goal of version 3.1.0 will be full support for macOS, tvOS, and watchOS as well as additional helper methods to retrieve and enumerate attributes in an attributed string.

If you have suggestions and feature requests, please feel free to open up an issue.

# Support

For questions and support, please open up an issue.

# License

SwiftyAttributes is available under the MIT license. See the LICENSE file for more info.
