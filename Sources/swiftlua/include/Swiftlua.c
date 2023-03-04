#include "Swftlua.h"

void luaS_pushnil(lua_State* L) {
    lua_pushnil(L);
}
void luaS_pushboolean(lua_State* L, int b) {
    lua_pushboolean(L, b);
}
void luaS_pushnumber(lua_State* L, double n) {
    lua_pushnumber(L, n);
}
void luaS_pushstring(lua_State* L, const char* s) {
    lua_pushstring(L, s);
}
void luaS_pushlstring(lua_State* L, const char* s, size_t length) {
    lua_pushlstring(L, s, length);
}
void luaS_pushliteral(lua_State* L, const char* s) {
    lua_pushstring(L, s);
}
void luaS_pop(lua_State* L, int n) {
    lua_pop(L, n);
}

int luaS_getglobal(lua_State* L, const char* name) {
    return lua_getglobal(L, name); 
}
void luaS_setglobal(lua_State* L, const char* name) {
    lua_setglobal(L, name);
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