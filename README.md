<!--
[![Coffee IT - Aroma CITTopTabBar iOS Component](https://coffeeit.nl/wp-content/uploads/2022/07/Aroma_Pincode_iOS.png)](https://coffeeit.nl/)
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

The CITPermissionCarousel package provides a configurable arrangement of permission views which help explain to the user which permission you'd like to receive and why, in a stylized manner.

## Installation

### SwiftPM

To install the Swift Package, go to Project > Package Dependencies > + > Search or Enter Package URL > Fill in:
```
https://github.com/Coffee-IT-Development/PermissionCarousel-iOS-Component
```

## Usage

Import CITPermissionCarousel and add a CITPermissionCarouselView to your SwiftUI view.

```swift
import CITPermissionCarousel
import SwiftUI

struct CITPermissionCarouselExampleView: View {
...

    var body: some View {
        CITPermissionCarouselView(config: .example)
    }
}
```

## Customization

```swift
/// The backgroundColor of the permission carousel view.
public var backgroundColor: Color
```

## Contact

For questions, ideas or help you can reach us by email at contact@coffeeit.nl.

## Maintainer

Owned by [Coffee IT](https://coffeeit.nl/).
Actively maintained by Lex Brouwers.

## More

Look at our other repositories on our [GitHub account](https://github.com/orgs/Coffee-IT-Development/repositories).

## License

Distributed under the MIT License. [See LICENSE](LICENSE.md) for more information.
