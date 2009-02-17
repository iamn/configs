

if [ -d /apps/hmpv ]; then
	export MAPARCH=mapca
	export ETI_TOOLKIT="/apps/hmpv/r5.5"
	export EQUATOR_ROOT="/apps/hmpv/r5.5"
	export LD_LIBRARY_PATH="/apps/hmpv/r5.5/board_support/lib"
	export PATH="$PATH":/apps/hmpv/r5.5/bin

	#
	# Setup environment for HMPV tools for sun4 or bsdi platforms
	#
	# Kevin Hilman 04/15/97
	#

	#echo "Setting up HMPV environment for platform: ${HOSTTYPE}"

	lastcwd=`pwd`
	cd /apps/hmpv/r5.5/
	source  ./setup_sh
	cd $lastcwd
	export ETI_LSH=0
	export ETI_TOOLS=/apps/hmpv/r5.5 
fi
