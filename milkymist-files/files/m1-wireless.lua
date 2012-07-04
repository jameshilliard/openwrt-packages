#!/usr/bin/env lua

local io     = require "io"
local os     = require "os"
local table  = require "table"

function trim (s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function split(delim, text)
	local list = {}
	if string.len(text) <= 0 then
	   return list
	end
	delim = delim or ""
	local pos = 1
	-- if delim matches empty string then it would give an endless loop
	if string.find("", delim, 1) and delim ~= "" then 
	   error("delim matches empty string!")
	end
	local first, last
	while 1 do
	   if delim ~= "" then 
	      first, last = string.find(text, delim, pos)
	   else
	      first, last = string.find(text, "%s+", pos)
	      if first == 1 then
		 pos = last+1
		 first, last = string.find(text, "%s+", pos)
	      end
	   end
	   if first then -- found?
	      table.insert(list, string.sub(text, pos, first-1))
	      pos = last+1
	   else
	      table.insert(list, string.sub(text, pos))
	      break
	   end
	end
	return list
end

function exec(command)
        local pp   = io.popen(command)
        local data = pp:read("*a")
	pp:close()

        return data
end

function iwscan(iface)
	local siface = iface or ""
	local cnt = exec("iwlist "..siface.." scan 2>/dev/null")
	local iws = {}

	cnt = trim(cnt)
	for i, l in pairs(split("\n          Cell", cnt)) do
	   local ESSID = l:match("ESSID:\"(.-)\"")
	   if ESSID then
	      local Q = l:match("Quality[:=](.-)[ ]")
	      local A = l:match("Authentication Suites.- : (.-)\n")
	      local P = l:match("Pairwise Ciphers.- : (.-)\n")
	      
	      local enc
	      if not l:find("Encryption key:on") then
		 enc = "none"
	      else
		 local wpa = l:find("WPA Version 1")
		 local rsn = l:find("WPA2 Version 1")
		 if wpa and rsn then enc = "psk+psk2"
		 elseif rsn then enc = "psk2"
		 elseif wpa then enc = "psk"
		 else enc = "wep" end
	      end

	      local r = Q .. "\t" .. ESSID .. "\t" .. enc

	      table.insert(iws, r)
	   end
	end
	
	return iws
end

local t = iwscan("wlan0")
for k,v in pairs(t) do print(v) end
