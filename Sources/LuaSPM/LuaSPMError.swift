import Foundation

public enum LuaSPMError: Error {
    case variableNotFound

    case unexpected(code: Int)
}

extension LuaSPMError {
    var isFatal: Bool {
        if case LuaSPMError.unexpected = self {return true}
        else {return false}
    }
}

extension LuaSPMError: CustomStringConvertible {
    public var description: String {
        switch self {
            case .variableNotFound:
                return "The specified lua variable was not found"
            case .unexpected(_):
                return "An unexpected error occurred"
        }
    }
}