-- initialise Lua bindings for PLplot examples.
if string.sub(_VERSION,1,7)=='Lua 5.0' then
	lib=loadlib('/home/pub/spock/src/qi/openwrt-xburst/build_dir/target-mipsel_uClibc-0.9.30.1/plplot-5.9.7/bindings/lua/plplotluac.so','luaopen_plplotluac') or
      loadlib('/home/pub/spock/src/qi/openwrt-xburst/build_dir/target-mipsel_uClibc-0.9.30.1/plplot-5.9.7/bindings/lua/plplotluac.dll','luaopen_plplotluac') or
      loadlib('/home/pub/spock/src/qi/openwrt-xburst/build_dir/target-mipsel_uClibc-0.9.30.1/plplot-5.9.7/bindings/lua/plplotluac.dylib','luaopen_plplotluac')
	assert(lib)()
else
	package.cpath = '/home/pub/spock/src/qi/openwrt-xburst/build_dir/target-mipsel_uClibc-0.9.30.1/plplot-5.9.7/bindings/lua/?.so;' ..
                  '/home/pub/spock/src/qi/openwrt-xburst/build_dir/target-mipsel_uClibc-0.9.30.1/plplot-5.9.7/bindings/lua/?.dll;' ..
                  '/home/pub/spock/src/qi/openwrt-xburst/build_dir/target-mipsel_uClibc-0.9.30.1/plplot-5.9.7/bindings/lua/?.dylib;' ..package.cpath
	require('plplotluac')
end
