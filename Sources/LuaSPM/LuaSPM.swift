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
    public func CompileAndRunString(_ s: String) throws {
        let out = lua.luaS_dostring(VM, s.cString(using: String.Encoding.utf8))
        if out == 0 {
            return
        }
        else {
            throw LuaSPMError.badLua
        }
    }
    public func CompileAndRunFile(_ fn: String) throws {
        let out = lua.luaS_dofile(VM, fn.cString(using: String.Encoding.utf8))
        if out == 0 {
            return 
        }
        else {
            throw LuaSPMError.badLua
        }
    }
    public func CheckNil(_ name: String) -> Bool { // True if nil
        let type = luaS_getglobal(VM, name)
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
        if path.contains(".") {
            throw LuaSPMError.notImplemented
        }
        if luaS_getglobal(VM, path) == LuaTypeTable.bool.rawValue {
            return LuaSPMShared.LuaBool(path, self)
        }
        throw LuaSPMError.incompatibleType
    }
    public func MakeVMNumberShared(_ path: String) throws -> LuaSPMShared.LuaNumber {
        if path.contains(".") {
            throw LuaSPMError.notImplemented
        }
        if luaS_getglobal(VM, path) == LuaTypeTable.number.rawValue {
            return LuaSPMShared.LuaNumber(path, self)
        }
        throw LuaSPMError.incompatibleType
    }
    public func MakeVMStringShared(_ path: String) throws -> LuaSPMShared.LuaString {
        if path.contains(".") {
            throw LuaSPMError.notImplemented
        }
        if luaS_getglobal(VM, path) == LuaTypeTable.string.rawValue {
            return LuaSPMShared.LuaString(path, self)
        }
        throw LuaSPMError.incompatibleType
    }
    public func MakeVMTableShared(_ path: String) throws -> LuaSPMShared.LuaTable {
        if path.contains(".") {
            throw LuaSPMError.notImplemented
        }
        if luaS_getglobal(VM, path) == LuaTypeTable.table.rawValue {
            return LuaSPMShared.LuaTable(path, self)
        }
        throw LuaSPMError.incompatibleType
    }
}
