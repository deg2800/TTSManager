import Foundation
import AVFoundation

public enum TTSControllerError: Error {
    case noCurrentVoice
}

public class TTSController {
    private var _availableVoices: [AVSpeechSynthesisVoice]
    private var _currentVoice: AVSpeechSynthesisVoice?
    private var _synthesizer: AVSpeechSynthesizer
    private var _rate: Float
    
    public init(for language: String, with rate: Float = 0.5) {
        _availableVoices = AVSpeechSynthesisVoice.speechVoices().filter { $0.language.contains(language) }
        _synthesizer = AVSpeechSynthesizer()
        _rate = rate
        setVoice(_availableVoices.randomElement())
    }
    
    public func speak(text: String, with voice: AVSpeechSynthesisVoice? = nil, at rate: Float? = nil) throws {
        guard let currentVoice = _currentVoice else {
            throw TTSControllerError.noCurrentVoice
        }
        
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.voice = voice ?? currentVoice
        speechUtterance.rate = rate ?? _rate
        _synthesizer.speak(speechUtterance)
    }
    
    public func setLanguage(_ language: String) {
        _availableVoices = AVSpeechSynthesisVoice.speechVoices().filter { $0.language.contains(language) }
    }
    
    public func setVoice(_ voice: AVSpeechSynthesisVoice?) {
        _currentVoice = voice
    }
}
