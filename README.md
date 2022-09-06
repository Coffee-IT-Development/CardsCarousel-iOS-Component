<!--
[![Coffee IT - Aroma CITCardsCarousel iOS Component](https://coffeeit.nl/wp-content/uploads/2022/07/Aroma_Pincode_iOS.png)](https://coffeeit.nl/)
-->

[![Swift](https://img.shields.io/badge/Swift-5.6-red?style=flat-square)](https://img.shields.io/badge/Swift-5.6-red?style=flat-square)
[![iOS 14+](https://img.shields.io/badge/iOS-v14+-pink?style=flat-square)](https://img.shields.io/badge/iOS-v14+-pink?style=flat-square)
[![Mirror Repository](https://img.shields.io/badge/Mirror-Repository-pink?style=flat-square)](https://img.shields.io/badge/Mirror-Repository-pink?style=flat-square)
[![License](https://img.shields.io/badge/License-MIT-pink.svg?style=flat-square)](LICENSE.md)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-Compatible-red?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-Compatible-red?style=flat-square)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-@CoffeeIT-blue.svg?style=flat-square)](https://linkedin.com/company/coffee-it)
[![Facebook](https://img.shields.io/badge/Facebook-CoffeeITNL-blue.svg?style=flat-square)](https://www.facebook.com/CoffeeITNL/)
[![Instagram](https://img.shields.io/badge/Instagram-CoffeeITNL-blue.svg?style=flat-square)](https://www.instagram.com/coffeeitnl/)
[![Twitter](https://img.shields.io/badge/Twitter-CoffeeITNL-blue.svg?style=flat-square)](https://twitter.com/coffeeitnl)

The CITCardsCarousel package provides a configurable arrangement of swipe-able card views which can be used for tutorials and other flows.
Includes page indicators, skip, previous, next and finish buttons.

## Installation

### SwiftPM

To install the Swift Package, go to Project > Package Dependencies > + > Search or Enter Package URL > Fill in:
```
https://github.com/Coffee-IT-Development/CardsCarousel-iOS-Component
```

## Usage

Import CITCardsCarousel and add a CITCardsCarouselView to your SwiftUI view.

```swift
import CITCardsCarousel
import SwiftUI

struct CITCardsCarouselExampleView: View {
...

    var body: some View {
        CITCardsCarouselView(config: .example)
    }
}
```

## Customization

```swift
/// The backgroundColor of the cards carousel view.
public var backgroundColor: Color
```

## Contact

For questions, ideas or help you can reach us by email at contact@coffeeit.nl.

## Maintainer

Owned and actively maintained by [Coffee IT](https://coffeeit.nl/).

## More

Look at our other repositories on our [GitHub account](https://github.com/orgs/Coffee-IT-Development/repositories).

## License

Distributed under the MIT License. [See LICENSE](LICENSE.md) for more information.
