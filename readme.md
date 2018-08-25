<p align="center">
    <h1 align="center">ChainableAnimation</h1>
</p1>

<p align="center">
    <a href=".license-mit"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</p>

## Usage
```swift
ChainableAnimation
    .animate(duration: 0.75) {
        self.animationView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
    }
    .springAnimate(duration: 0.5, dampingRatio: 0.4) {
        self.animationView.transform = CGAffineTransform.identity
    }
    .start()
```

## License
ChainableAnimation is available under the MIT license. See the [LICENSE file](https://github.com/atsushi130/ChainableAnimation/blob/master/license-mit).
