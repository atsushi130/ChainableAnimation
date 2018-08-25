<p align="center">
    <h1 align="center">ChainableAnimation</h1>
</p1>

<p align="center">
    <a href=".license"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
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

## Animate Methods
```swift
- static func animate(duration:delay:options:animation:)
- func animate(duration:delay:options:animation:)
- static func springAnimate(duration:delay:dampingRatio:velocity:options:animation:)
- func springAnimate(duration:delay:dampingRatio:velocity:options:animation:)
- func start()
```

## License
ChainableAnimation is available under the MIT license. See the [LICENSE file](https://github.com/atsushi130/ChainableAnimation/blob/master/license).
