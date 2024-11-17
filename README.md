
# TTSManager

`TTSManager` is a Swift package designed to simplify Text-to-Speech (TTS) functionality across Apple platforms using `AVFoundation`. This package supports iOS, macOS, tvOS, and watchOS, offering a clean and flexible API for managing voices, speech rates, and utterances.

## Features

- 🔄 Dynamically filter voices by language.
- 🎙 Set and customize the speaking rate and voice.
- 📚 Simple API for managing Text-to-Speech.
- ❌ Error handling for missing voices.
- ✅ Supports iOS, macOS, tvOS, and watchOS.

## Platforms

- **iOS:** 13.0+
- **macOS:** 10.15+
- **tvOS:** 13.0+
- **watchOS:** 6.0+

## Installation

### Swift Package Manager (SPM)

To integrate `TTSManager` into your project, use Swift Package Manager:

1. Open your project in Xcode.
2. Go to **File > Add Packages**.
3. Enter the repository URL for `TTSManager`:
   ```
   https://github.com/deg2800/TTSManager.git
   ```
4. Select the latest version and add the package.

### Manual

Alternatively, download the source files and include them in your project.

## Usage

### Import the Library

Import `TTSManager` into your Swift file:

```swift
import TTSManager
```

### Initialization

Create a `TTSController` instance with a specified language and default rate:

```swift
let ttsController = TTSController(for: "es", with: 0.5) // Spanish language, rate of 0.5
```

### Speaking Text

Speak a string using the default voice and rate:

```swift
try? ttsController.speak(text: "Hola, ¿cómo estás?")
```

Speak with a specific voice and custom rate:

```swift
let customVoice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Monica-compact")
try? ttsController.speak(text: "Hola, ¿cómo estás?", with: customVoice, at: 0.4)
```

### Managing Voices

Set the current voice:

```swift
let newVoice = ttsController._availableVoices.first
ttsController.setVoice(newVoice)
```

Update the available voices for a specific language:

```swift
ttsController.setLanguage("en") // Switch to English voices
```

## Targets

- **TTSManager:** The main library target providing TTS functionality.

## Requirements

- Swift 5.0+
- `AVFoundation` Framework

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
