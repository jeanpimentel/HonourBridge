# Honour Brigde

![Language](https://img.shields.io/badge/lang-Objective%E2%80%93C-blue.svg)
[![Language](https://img.shields.io/badge/lang-Swift-orange.svg)](https://developer.apple.com/swift/)
![License](https://img.shields.io/badge/license-MIT-lightgray.svg)

## **Objective-C Bridge** for [Honour Validation library](https://github.com/jeanpimentel/Honour)

Bridge classes to allow you to use Honour in Objective-C projects.

```swift
Validator.mustBe(Uppercase()).andMust(StartsWith("F")).validate("FOOBAR")
```

Turns to:

```objc
[[[HBValidator mustBe:[HBUppercase new]] andMust:[[HBStartsWith alloc] initWithValue:@"F"]] validate:@"FOOBAR"];
```


# Usage

## Single Validation

```objc
NSString *username = @"jeanpimentel";
[[HBLowercase new] validate:username];
```

## Chained Validation

It is possible to use validators in a chain. 

```objc
NSString *username = @"jeanpimentel";

HBValidator *v = [HBValidator new];
[v addRule:[HBLowercase new]];
[v addRule:[HBNoWhitespace new]];
[v addRule:[[HBLength alloc] initWithMin:3 max:60]];

[v validate:username]; // YES

// or

[[v addRule:[HBLowercase new]] addRule:[HBNoWhitespace new]] addRule:[[HBLength alloc] initWithMin:3 max:60]];
[v validate:username]; // YES
```

## Syntax sugar

It is possible to use some syntax tricks to be highly expressive.

```objc
HBValidator *v = [[[HBValidator mustHave:[[HBLength alloc] initWithMin:3 max:60]]
                                     and:[HBNoWhitespace new]]
                               andMustBe:[HBLowercase new]];

[v validate:@"jeanpimentel"]; // YES
```

## Granularity control

We have 3 validation methods

- `validate()` - returns YES or NO
- `assert()` - returns a instance of HBAssertResult that contains the result YES/NO and all errors, if any.
- `check()` - returns a instance of HBCheckResult that contains the result YES/NO and the first error, if any.

### Validate
```objc
- (BOOL)validate:(NSString *)value;
```

```objc
HBValidator *validator = [[HBValidator alloc] init];
[validator addRule:[[HBUppercase alloc] init]];
[validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];

[validator validate:@"JEAN"]; // YES
[validator validate:@"PIMENTEL"]; // NO
```

### Assert 
```objc
- (HBAssertResult *)assert:(NSString *)value;
```

```objc
HBValidator *validator = [[HBValidator alloc] init];
[validator addRule:[[HBUppercase alloc] init]];
[validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];

HBAssertResult *result = [validator assert:@"JEAN"];
result.isValid      // YES
result.invalidRules // [] (empty)

HBAssertResult *result = [validator assert:@"Jean"];
result.isValid      // NO
result.invalidRules // [HBUppercase*]

HBAssertResult *result = [validator assert:@"Felipe"];
result.isValid      // NO
result.invalidRules // [HBUppercase*, HBStartsWith*]
```

### Check
```objc
- (HBCheckResult *)check:(NSString *)value;
```

```objc
HBValidator *validator = [[HBValidator alloc] init];
[validator addRule:[[HBUppercase alloc] init]];
[validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];

HBAssertResult *result = [validator assert:@"JEAN"];
result.isValid     // YES
result.invalidRule // nil

HBAssertResult *result = [validator assert:@"Felipe"];
result.isValid     // NO
result.invalidRule // HBUppercase*

HBAssertResult *result = [validator assert:@"FELIPE"];
result.isValid     // NO
result.invalidRule // HBStartsWith*
```


## Requirements

|                       HonourBridge Version                       | Minimum iOS Target |               Notes                |
|:----------------------------------------------------------------:|:------------------:|:----------------------------------:|
| [0.1.0](https://github.com/jeanpimentel/HonourBridge/tree/0.1.0) |       iOS 7        | Xcode 6.3 (Swift 1.2) is required. |


# Contributing

- If you **found a bug**, _and can provide steps to reliably reproduce it_, open an issue.

- If you **have a feature request**, open an issue.

- If you **want to contribute**, submit a pull request.
	1. Fork it!
	2. Create your feature branch: `git checkout -b my-new-feature`
	3. Commit your changes: `git commit -am 'Add some feature'`
	4. Push to the branch: `git push origin my-new-feature`
	5. Submit a pull request

# Validators

Working in progress...

**Implemented:**

- Contains
- EndsWith
- Length
- Lowercase
- StartsWith
- Uppercase

# License

HonourBridge is released under the MIT license. See [LICENSE](LICENSE) for details.
