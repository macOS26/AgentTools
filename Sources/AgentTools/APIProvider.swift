import Foundation

public enum APIProvider: String, CaseIterable, Codable, Sendable {
    case claude = "claude"
    case openAI = "openAI"
    case gemini = "gemini"
    case grok = "grok"
    case mistral = "mistral"
    case codestral = "codestral"
    case vibe = "vibe"
    case deepSeek = "deepSeek"
    case huggingFace = "huggingFace"
    case zAI = "zAI"
    case ollama = "ollama"
    case localOllama = "localOllama"
    case vLLM = "vLLM"
    case lmStudio = "lmStudio"
    case foundationModel = "foundationModel"

    public var displayName: String {
        switch self {
        case .claude: "Claude"
        case .openAI: "OpenAI"
        case .gemini: "Google Gemini"
        case .grok: "Grok"
        case .mistral: "Mistral"
        case .codestral: "Codestral"
        case .vibe: "Mistral Vibe"
        case .deepSeek: "DeepSeek"
        case .huggingFace: "Hugging Face"
        case .ollama: "Ollama"
        case .localOllama: "Local Ollama"
        case .vLLM: "vLLM"
        case .lmStudio: "LM Studio"
        case .zAI: "Z.ai"
        case .foundationModel: "Apple Intelligence"
        }
    }

    public static var selectableProviders: [APIProvider] {
        [.claude, .openAI, .gemini, .grok, .mistral, .codestral, .vibe, .deepSeek, .huggingFace, .zAI, .ollama, .localOllama, .vLLM, .lmStudio]
    }
}
