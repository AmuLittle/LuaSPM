import Foundation
import lua

public class LuaSPM {
    public private(set) var version = "0.1.0"
    public private(set) var VM: UnsafeMutablePointer<lua_State>

    public init() {
        VM = luaL_newstate()
        luaL_openlibs(VM)
    }
    deinit {
        lua_close(VM)
    }
    public func CompileAndRunString(s: String) -> Bool {
        let out = lua.luaS_dostring(VM, s.cString(using: String.Encoding.utf8))
        if out == 0 {
            return true
        }
        else {
            return false
        }
    }
    public func CompileAndRunFile(fn: String) -> Bool {
        let out = lua.luaS_dofile(VM, fn.cString(using: String.Encoding.utf8))
        if out == 0 {
            return true
        }
        else {
            return false
        }
    }
    public func GetGlobalBool(s: String) throws -> Bool {
        let type = lua_getglobal(VM, s)
        if type == LuaTypes.bool.rawValue && luaS_isboolean(VM, -1) == 1 {
            let out = lua_toboolean(VM, -1)
            luaS_pop(VM, 1)
            if out == 0 {
                return false
            }
            else {
                return true
            }
        }
        luaS_pop(VM, 1)
        throw LuaSPMError.variableNotFound
    }
    public func SetGlobal<T>(s: String, v: T) {
        
    }
}