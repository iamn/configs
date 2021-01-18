export P4PORT=scm.factset.com:1666
export P4DIFF='vimdiff '

export ref="/home/dev/fonix/online/ref/src"
export qa="/home/dev/fonix/online/qa/src"
export devel="/home/dev/fonix/online/devel/src"
export build="/home/dev/fonix/online/build/src"



#
# Add jake's bin files:
#
export MANPATH="$MANPATH:~/local/man:~/local/share/man"


################################################################################
# Configure the environment:
#



################################################################################
# Add FDB & FCD utilities:
#
. /home/fonix/prd_progs/tools/fdb_utils.sh


# an easy way to figure out which compilation units we're going to run:
alias fdswhich="ruby ~lcapaldo/fdswhich.rb"


################################################################################
# functions that make living with VMS much easier
#
#alias perf="(set -f && p4 $@)"
alias perf="p4"
alias type="cat"
alias del="rm -i"


alias fqlf="fql_definition"
alias gd="source /home/fonix/prd_progs/tools/define_rakefds_logicals.sh release"
alias gdd="source /home/fonix/prd_progs/tools/define_rakefds_logicals.sh debug"
alias reviewboard='/home/data/index/script/common/submit_review_board.pl'
alias rb_new='~zauclair/submit_review_board_new.pl'
alias usc="us_calc"

alias defsd='source X86_64_DEBUG/environment.sh'
alias defsr='source X86_64/environment.sh'

#alias xdb='xterm -font 10x20 +sb -fg goldenrod1 -bg black -e gdb --tty `tty` --args'
alias xdb='xterm -font 9x15 -rightbar -fg goldenrod1 -bg black -e gdb --tty `tty` --args'
alias rgd="xdb fonix_gui_test_harness -mm"


alias valgrind='valgrind --suppressions=/home/dev/fonix/online/devel/src/online.supp'


#
# Perforce - specific aliases
#
alias p4branch='p4 branch `grep P4BRANCH .p4rc | cut -d = -f2`'
alias p4branchDel='p4 branch -d `grep P4BRANCH .p4rc | cut -d = -f2`'

alias p4clientDel='p4 sync \#none && p4 client -d $(grep P4CLIENT .p4rc | cut -d = -f2)'
alias p4lsChanges='p4 changes -L -c $(grep P4CLIENT .p4rc | cut -d = -f2)'
alias p4diff='P4DIFF=colordiff p4 diff'

unalias p4    # take the training wheels off --- no p4fds.pl!

alias lunch_vote="~sjaffe/tools/lunch/vote_for_lunch"
