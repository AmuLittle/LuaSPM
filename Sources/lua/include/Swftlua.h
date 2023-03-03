#ifndef LUASLIB
#include "../lprefix.h"
#define LUA_CORE
#define LUA_LIB
#define ltable_c
#define lvm_c
#include "../luaconf.h"
#undef LUAI_FUNC
#undef LUAI_DDEC
#undef LUAI_DDEF
#define LUAI_FUNC	static
#define LUAI_DDEC(def)
#define LUAI_DDEF	static
#include "../lzio.c"
#include "../lctype.c"
#include "../lopcodes.c"
#include "../lmem.c"
#include "../lundump.c"
#include "../ldump.c"
#include "../lstate.c"
#include "../lgc.c"
#include "../llex.c"
#include "../lcode.c"
#include "../lparser.c"
#include "../ldebug.c"
#include "../lfunc.c"
#include "../lobject.c"
#include "../ltm.c"
#include "../lstring.c"
#include "../ltable.c"
#include "../ldo.c"
#include "../lvm.c"
#include "../lapi.c"
#include "../lauxlib.c"
#include "../lbaselib.c"
#include "../lcorolib.c"
#include "../ldblib.c"
#include "../liolib.c"
#include "../lmathlib.c"
#include "../loadlib.c"
#include "../loslib.c"
#include "../lstrlib.c"
#include "../ltablib.c"
#include "../lutf8lib.c"
#include "../linit.c"

int luaS_getglobal(lua_State* L, const char* name) {
    return lua_getglobal(L, name);
}

void luaS_pop(lua_State* L, int n) {
    lua_pop(L, n);
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
#define LUASLIB
#endif