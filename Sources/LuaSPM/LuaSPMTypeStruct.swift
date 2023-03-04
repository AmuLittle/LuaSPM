import Foundation
import lua

public class LuaType {
    internal var data: Any;
    public private(set) var name: String;
    public private(set) var type: LuaTypeTable;
    convenience public init() {
        self.init("", LuaTypeTable.undetermined, 0 as Any)
    }
    public init(_ name: String, _ type: LuaTypeTable, _ data: Any) {
        self.name = name
        self.type = type
        self.data = data
    }
}

public struct LuaTypes {
    public class Nilable: LuaType {
        convenience public init() {
            self.init("", false, false)
        }
        convenience public init(_ name: String, _ is_nil: Bool) {
            self.init(name, is_nil, true)
        }
        init(_ name: String, _ is_nil: Bool, _ do_init: Bool) {
            if do_init {
                super.init(name, LuaTypeTable.lua_nil, is_nil as Any)
            }
            else {
                super.init("", LuaTypeTable.undetermined, 0 as Any)
            }
        }
        public var is_nil: Bool {
            return super.data as! Bool
        }
    }
    public class Boolean: LuaType {
        convenience public init() {
            self.init("", false, false)
        }
        convenience public init(_ name: String, _ value: Bool) {
            self.init(name, value, true)
        }
        init(_ name: String, _ value: Bool, _ do_init: Bool) {
            if do_init {
                super.init(name, LuaTypeTable.lua_nil, value as Any)
            }
            else {
                super.init("", LuaTypeTable.undetermined, 0 as Any)
            }
        }
        public var value: Bool {
            return super.data as! Bool
        }
    }
}