set history save on
set history size 10000
set history filename ~/.gdb_history
#add-auto-load-safe-path . 

#set debug dwarf-die 1
#set debug dwarf-line 1
#set debug dwarf-read 1
#set debug symbol-lookup 3

# Don't ask "Make breakpoint pending on future shared library load"
set breakpoint pending on

alias ir=i r

define src 
    lay src
end

define asm
    lay asm
end

define connect
    set sysroot /home/s00538726/sysroot
    target remote :2000
end

# repeatedly run application
define repeat
    b _exit
    commands run
end

define arkc
  p "LR"
  x/gfx $arg0 + 8
  p "FP"
  x/gfx $arg0
  p "METHOD"
  x/gfx $arg0 - 8
  p "PROPERTIES"
  x/gfx $arg0 - 16
end


define debugme1
    @REM command 1
    @REM     x/x 0x7fffff2598
    @REM     continue
    @REM end
    @REM b *0x7fbd145174
    @REM command 2
    @REM     x/x 0x7fffff2598
    @REM     continue
    @REM end
    @REM b *0x7fbd1451a0
    @REM command 3
    @REM     x/x 0x7fffff2598
    @REM     continue
    @REM end
end

#target remote 127.0.0.1:1234
#set solib-search-path /usr/aarch64-linux-gnu/lib
#set solib-search-path /home/s00538726/bld/clion/debugarm64/lib:/usr/aarch64-linux-gnu/lib
#set solib-search-path /usr/arm-linux-gnueabihf/lib:/home/s00538726/projects/zpanda/cmake-build-tmp/lib
#set sysroot /
