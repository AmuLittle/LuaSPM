import Foundation
@_exported import lua

public class LuaSPM {
    public private(set) var version = "0.1.0"
    public private(set) var VM: OpaquePointer?

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
    public func CheckNil(name: String) throws -> Bool { // True if nil
        let type = luaS_getglobal(VM, name)
        luaS_pop(VM, 1);
        if type == LuaTypeTable.lua_nil.rawValue {
            return true
        }
        else {
            return false
        }
    }
    public func GetGlobal<T: LuaType>(_ name: String, _ output: inout T) throws { // Returns value of bool var, if var is not bool it will return varNotFound
        let type = luaS_getglobal(VM, name)
        if LuaTypeTable.lua_nil.rawValue == type && output is LuaTypes.Nilable {
            output = LuaTypes.Nilable(name, true) as! T
        }
        else if LuaTypeTable.bool.rawValue == type && output is LuaTypes.Boolean {
            
        }
        luaS_pop(VM, 1)
        return
    }
    public func SetGlobal<T>(s: String, v: T) {
        
    }
}