# SwiftUI Code39

SwiftUI Code39 is a Swift package that provides an easy way to generate Code 39 barcodes in your SwiftUI applications.

## Installation

To use SwiftUI Code39 in your project, add the following line to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/jiahan-wu/swiftui-code39.git", from: "1.0.0")
]
```

Then, import the package in your Swift code:

```swift
import Code39
```

## Usage

To generate a Code 39 barcode, simply create an instance of `Code39View` and provide the desired content as a string:

```swift
struct ContentView: View {
    var body: some View {
        Code39View("HELLO WORLD")
            .frame(width: 296, height: 96)
    }
}
```

## Important Note

It is the responsibility of the library user to ensure that the content passed to `Code39View` consists of valid characters supported by Code 39. You can use the `code39SupportedCharacters` set to check if a character is supported:

```swift
let content = "HELLO"
let isValid = content.allSatisfy { code39SupportedCharacters.contains($0) }
```

## License

SwiftUI Code39 is released under the MIT License. See the `LICENSE` file for more information.

## Contributing

Contributions to SwiftUI Code39 are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request on the GitHub repository.
