import XCTest

@testable import LuaSPM

final class LuaSPMTests: XCTestCase {
    func test_create() throws {
        XCTAssertEqual(LuaSPM().version, "0.1.0")
    }
    func test_execute_string() throws {
        let example_lua = "print(\"Hello, World\")"
        XCTAssertEqual(LuaSPM().CompileAndRunString(s: example_lua), true)
    }
    func test_execute_file() throws {
        let example_file = "./Examples/Hello.lua"
        XCTAssertEqual(LuaSPM().CompileAndRunFile(fn: example_file), true)
    }
    func test_lua_get() throws {
        let L = LuaSPM()
        _ = L.CompileAndRunString(s: """
            is_nil = nil
            is_bool = true
            is_number = 1
            is_string = "yes"
            function is_function()
                print("is function")
            end
            is_table = {}
        """)
        var lua_nil = LuaTypes.Nilable()
        try L.GetGlobal("is_nil", &lua_nil)
        XCTAssertEqual(lua_nil.is_nil, true)
    }
    func test_type_enum() throws {
        let L = LuaSPM()
        _ = L.CompileAndRunString(s: """
            is_nil = nil
            is_bool = true
            is_number = 1
            is_string = "yes"
            function is_function()
                print("is function")
            end
            is_table = {}
        """)
        XCTAssertEqual(luaS_getglobal(L.VM, "is_nonexistient"), LuaTypeTable.lua_nil.rawValue)
        XCTAssertEqual(luaS_getglobal(L.VM, "is_nil"), LuaTypeTable.lua_nil.rawValue)
        XCTAssertEqual(luaS_getglobal(L.VM, "is_bool"), LuaTypeTable.bool.rawValue)
        XCTAssertEqual(luaS_getglobal(L.VM, "is_number"), LuaTypeTable.number.rawValue)
        XCTAssertEqual(luaS_getglobal(L.VM, "is_string"), LuaTypeTable.string.rawValue)
        XCTAssertEqual(luaS_getglobal(L.VM, "is_function"), LuaTypeTable.function.rawValue)
        XCTAssertEqual(luaS_getglobal(L.VM, "is_table"), LuaTypeTable.table.rawValue)
    }
}
