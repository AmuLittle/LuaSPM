#include "Swftlua.h"

void luaS_pop(lua_State* L, int n) {
    lua_pop(L, n);
}

int luaS_getglobal(lua_State* L, const char* name) {
    return lua_getglobal(L, name); 
}

int luaS_dostring(lua_State* L, const char* s) {
    return luaL_dostring(L, s);
}

int luaS_dofile(lua_State* L, const char* fn) {
    return luaL_dofile(L, fn);
}

int luaS_isboolean(lua_State* L, int n) {
    return lua_isboolean(L, n);
}