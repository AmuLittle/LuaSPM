import Foundation

public enum LuaTypes: Int32 {
    case lua_nil = 0
    case bool = 1
    case thread = 2
    case number = 3
    case string = 4
    case table = 5
    case function = 6
    case userdata = 7
}