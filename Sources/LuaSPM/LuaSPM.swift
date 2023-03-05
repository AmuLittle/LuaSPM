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
    public func CompileAndRunString(_ s: String) -> Bool {
        let out = lua.luaS_dostring(VM, s.cString(using: String.Encoding.utf8))
        if out == 0 {
            return true
        }
        else {
            return false
        }
    }
    public func CompileAndRunFile(_ fn: String) -> Bool {
        let out = lua.luaS_dofile(VM, fn.cString(using: String.Encoding.utf8))
        if out == 0 {
            return true
        }
        else {
            return false
        }
    }
    public func CheckNil(_ name: String) -> Bool { // True if nil
        let type = luaS_getglobal(VM, name)
        luaS_pop(VM, 1);
        if type == LuaTypeTable.lua_nil.rawValue {
            return true
        }
        else {
            return false
        }
    }
    public func CreateSharedVar(_ type: LuaTypeTable) { // makes a new swift and lua variable that are shared
        
    }
    // MakeVMBoolShared..MakeVMFuncShared make a var from lua shared with swift
    public func MakeVMBoolShared(_ path: String) throws -> LuaSPMShared.LuaBool {
        if luaS_getglobal(VM, path) == LuaTypeTable.bool.rawValue {
            luaS_pop(VM, 1)
            return LuaSPMShared.LuaBool(path, self)
        }
        else {
            luaS_pop(VM, 1)
            throw LuaSPMError.incompatibleType
        }
    }
    public func MakeVMNumberShared(_ path: String) throws -> LuaSPMShared.LuaNumber {
        if luaS_getglobal(VM, path) == LuaTypeTable.number.rawValue {
            luaS_pop(VM, 1)
            return LuaSPMShared.LuaNumber(path, self)
        }
        else {
            luaS_pop(VM, 1)
            throw LuaSPMError.incompatibleType
        }
    }
    public func MakeVMStringShared(_ path: String) throws -> LuaSPMShared.LuaString {
        if luaS_getglobal(VM, path) == LuaTypeTable.string.rawValue {
            luaS_pop(VM, 1)
            return LuaSPMShared.LuaString(path, self)
        }
        else {
            luaS_pop(VM, 1)
            throw LuaSPMError.incompatibleTyp
        }
    }
}
