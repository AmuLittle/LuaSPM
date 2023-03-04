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
void luaS_setglobal(lua_State* L, const char* name);

int luaS_dostring(lua_State* L, const char* s);

int luaS_dofile(lua_State* L, const char* fn);

int luaS_isboolean(lua_State* L, int n);

#define LUASLIB
#endif