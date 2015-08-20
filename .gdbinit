set print address off
set print elements 9999
set print object on
set print vtbl on

#################################################################
#skip file fds_string.cxx
#skip file dynarray.cxx
#skip file dynarray_ptr_adapter.h
#skip file dynarray_impl.h
#skip file shared_ptr.hpp
#skip file scoped_ptr.hpp
#################################################################

#################################################################
# Source system-wide gdbinit.  For now, it has to be done manually:

source /home/fonix/prd_progs/tools/conf/gdb/common.gdbinit
#source ~/work/configs/conf/gdb/common.gdbinit


# don't ask me what to do for pending breakpoints:
set breakpoint pending on



#add-auto-load-safe-path /home/user/nimennov/work/canaan/.gdbinit
