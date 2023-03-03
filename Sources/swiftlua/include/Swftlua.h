#ifndef LUASLIB
#include "../lua.h"
#include "../lualib.h"
#include "../lauxlib.h"

void luaS_pop(lua_State* L, int n);

int luaS_getglobal(lua_State* L, const char* name);

int luaS_dostring(lua_State* L, const char* s);

int luaS_dofile(lua_State* L, const char* fn);

int luaS_isboolean(lua_State* L, int n);

#define LUASLIB
#endif