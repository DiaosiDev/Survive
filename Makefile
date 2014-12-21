CFLAGS = -g -Wall -fno-strict-aliasing -rdynamic -std=gnu99
LDFLAGS = -lpthread -lrt -llua -lm -ldl 
SHARED = -fPIC -shared
CC = gcc
DEFINE = -D_DEBUG -D_LINUX 
INCLUDE = -I../deps/KendyNet/include -I../deps -I../deps/lua-5.2.3/src

	
aoi.so:\
	common/aoi.c\
	common/lua_aoi.c
	$(CC) $(CFLAGS) $(SHARED) -o aoi.so common/aoi.c common/lua_aoi.c ../deps/KendyNet/libkendynet.a $(INCLUDE) $(DEFINE)
	
astar.so:\
	common/astar.c\
	common/lua_astar.c
	$(CC) $(CFLAGS) $(SHARED) -o astar.so common/astar.c common/lua_astar.c ../deps/KendyNet/libkendynet.a $(INCLUDE) $(DEFINE)		
	
	
all:aoi.so astar.so
