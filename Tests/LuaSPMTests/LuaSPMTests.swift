import XCTest

@testable import LuaSPM

final class LuaSPMTests: XCTestCase {
    func test_create() throws {
        XCTAssertEqual(LuaSPM().version, "0.1.0")
    }
    func test_execute_string() throws {
        let example_lua = "print(\"Hello, World\")"
        XCTAssertEqual(LuaSPM().CompileAndRunString(example_lua), true)
    }
    func test_execute_file() throws {
        let example_file = "./Examples/Hello.lua"
        XCTAssertEqual(LuaSPM().CompileAndRunFile(example_file), true)
    }
    func test_type_enum() throws {
        let L = LuaSPM()
        _ = L.CompileAndRunString("""
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
    func test_shared_var() throws {
        let L = LuaSPM()
        _ = L.CompileAndRunString("""
            is_nil = nil
            is_bool = true
            is_number = 1
            is_string = "yes"
            function is_function()
                print("is function")
            end
            is_table = {}
        """)
        let should_bool = try L.MakeVMBoolShared("is_bool")
        let should_number = try L.MakeVMNumberShared("is_number")
        let should_string = try L.MakeVMStringShared("is_string")
        XCTAssertEqual(L.CheckNil("is_nil"), true)
        XCTAssertEqual(should_bool.getValue(), true)
        XCTAssertEqual(should_number.getValue(), 1)
        XCTAssertEqual(should_string.getValue(), "yes")
        should_bool <~ false
        should_number <~ -1
        should_string <~ "no"
        XCTAssertEqual(should_bool.getValue(), false)
        XCTAssertEqual(should_number.getValue(), -1)
        XCTAssertEqual(should_string.getValue(), "no")
        _ = L.CompileAndRunString("""
            checks_succeeded = false
            if !is_bool and is_number == -1 and is_string == "no" then
                checks_succeeded = true
            end
        """)
        let checks = try L.MakeVMBoolShared("check_succeeded")
        XCTAssertEqual(checks.getValue(), true)
    }
}
