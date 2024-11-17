import Foundation
import AVFoundation

public enum TTSControllerError: Error {
    case noCurrentVoice
}

public class TTSController {
    public var availableVoices: [AVSpeechSynthesisVoice]
    private var _currentVoice: AVSpeechSynthesisVoice?
    private var _synthesizer: AVSpeechSynthesizer
    private var _rate: Float
    
    public init(for language: String, with rate: Float = 0.5) {
        availableVoices = AVSpeechSynthesisVoice.speechVoices().filter { $0.language.contains(language) }
        _synthesizer = AVSpeechSynthesizer()
        _rate = rate
        setVoice(availableVoices.randomElement())
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
        availableVoices = AVSpeechSynthesisVoice.speechVoices().filter { $0.language.contains(language) }
    }
    
    public func setVoice(_ voice: AVSpeechSynthesisVoice?) {
        _currentVoice = voice
    }
    
    public func setRate(_ rate: Float) {
        _rate = rate
    }
    
    public func getCurrentVoice() -> AVSpeechSynthesisVoice? {
        _currentVoice
    }
    
    public func getRate() -> Float {
        _rate
    }
}
