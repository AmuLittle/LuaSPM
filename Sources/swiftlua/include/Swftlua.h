#ifndef LUASLIB
#include <stdint.h>
#include "../lua.h"
#include "../lualib.h"
#include "../lauxlib.h"

void luaS_pushnil(lua_State* L);
void luaS_pushboolean(lua_State* L, int b);
void luaS_pushnumber(lua_State* L, double n);
void luaS_pushstring(lua_State* L, const char* s);
void luaS_pushlstring(lua_State* L, const char* s, size_t length);
void luaS_pushliteral(lua_State* L, const char* s);
void luaS_pop(lua_State* L, int n);

int luaS_getglobal(lua_State* L, const char* name);
int luaS_getfield(lua_State* L, int idx, const char* name);
void luaS_rawgeti(lua_State* L, int idx, int n);
void luaS_setglobal(lua_State* L, const char* name);
void luaS_setfield(lua_State* L, int idx, const char* name);
void luaS_rawseti(lua_State* L, int idx, int n);

int luaS_dostring(lua_State* L, const char* s);

int luaS_dofile(lua_State* L, const char* fn);

int luaS_isnil(lua_State* L, int idx);
int luaS_isboolean(lua_State* L, int idx);
int luaS_isnumber(lua_State* L, int idx);
int luaS_isstring(lua_State* L, int idx);
int luaS_istable(lua_State* L, int idx);
int luaS_toboolean(lua_State* L, int idx);
double luaS_tonumber(lua_State* L, int idx);
const char* luaS_tostring(lua_State* L, int idx);

#define LUASLIB
#endif
