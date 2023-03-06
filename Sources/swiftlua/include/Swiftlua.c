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
int luaS_getfield(lua_State* L, int idx, const char* name) {
    return lua_getfield(L, idx, name);
}
void luaS_rawgeti(lua_State* L, int idx, int n) {
    lua_rawgeti(L, idx, n);
}
void luaS_setglobal(lua_State* L, const char* name) {
    lua_setglobal(L, name);
}
void luaS_setfield(lua_State* L, int idx, const char* name) {
    lua_setfield(L, idx, name);
}
void luaS_rawseti(lua_State* L, int idx, int n) {
    lua_rawseti(L, idx, n);
}

int luaS_dostring(lua_State* L, const char* s) {
    return luaL_dostring(L, s);
}

int luaS_dofile(lua_State* L, const char* fn) {
    return luaL_dofile(L, fn);
}

int luaS_isnil(lua_State* L, int idx) {
    return lua_isnil(L, idx);
}
int luaS_isboolean(lua_State* L, int idx) {
    return lua_isboolean(L, idx);
}
int luaS_isnumber(lua_State* L, int idx) {
    return lua_isnumber(L, idx);
}
int luaS_isstring(lua_State* L, int idx) {
    return lua_isstring(L, idx);
}
int luaS_istable(lua_State* L, int idx) {
    return lua_istable(L, idx);
}
int luaS_toboolean(lua_State *L, int idx) {
    return lua_toboolean(L, idx);
}
double luaS_tonumber(lua_State *L, int idx) {
    return lua_tonumber(L, idx);
}
const char* luaS_tostring(lua_State *L, int idx) {
    return lua_tostring(L, idx);
}
