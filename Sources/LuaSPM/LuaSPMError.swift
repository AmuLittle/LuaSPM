import Foundation

public enum LuaSPMError: Error {
    case variableNotFound
    case noLuaInstance
    case notImplemented
    case incompatibleType

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
            case .noLuaInstance:
                return "Could not get var from lua VM because no lua VM is specified"
            case .notImplemented:
                return "The current operation requested could not be preformed because it has not been implemented yet"
        case .incompatibleType:
                return "The lua type does not match the swift type"
            case .unexpected(_):
                return "An unexpected error occurred"
        }
    }
}
