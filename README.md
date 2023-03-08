# 5AMSwiftGen

Add [SwiftGen](https://github.com/SwiftGen/SwiftGen/) to your Xcode Project or Swift Package as a Plugin.

Looks for `swiftgen.yml` in the root of Xcode Project or Swift Package.

Generated files are saved in the `Generated` directory.

### Info

- SwiftGen Version: 6.6.2
- SwiftGen Repo: https://github.com/SwiftGen/SwiftGen/


### Usage in Xcode Project

1. Add this repo https://github.com/5amdotis/5AMSwiftGen as Swift Package to your project
2. Add `SwiftGenPlugin` to Run Build Tool Plug-ins in Build Phases
3. Build project
4. Trust and Enable Build Plug-ins
5. For CI/CD: add option `-skipPackagePluginValidation` to `xcodebuild` command


### Usage in Swift Package

1. Add dependency
``` 
dependencies: [
    // ...
    .package(url: "https://github.com/5amdotis/5AMSwiftGen", from: "1.0.0"),
]
```
2. Add to target
```
targets: [
    .target(
        name: "YOUR_TARGET",
        dependencies: [],
        plugins: [
            .plugin(name: "SwiftGenPlugin", package: "5AMSwiftLint")
        ]
    ),
]
```
3. Build package


### License

See LICENSE.md
