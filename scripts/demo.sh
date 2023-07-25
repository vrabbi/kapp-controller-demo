########################
# include the magic
########################
. scripts/demo-magic.sh

# Add Custom Collor schemes for output
bold=`tput bold`
std=`tput sgr0`
ul=`tput smul`

# some supporting functions

HOST=`hostname -s`
UNIXPROMPT=""
#UNIXPROMPT="# "

function prompt
{
    echo; echo "------> $*"
    echo; echo -n "$UNIXPROMPT"
}

# hide the evidence
clear
slides slides/opening-slides.md

prompt Lets first apply our apps
pe "kubectl apply -f demo-apps/"
prompt Lets see what configurations we have applied
pe "tree demo-apps"
wait
clear
prompt Lets look at the cert-manager example
pe "bat demo-apps/cert-manager.yaml"
wait
clear
prompt Lets look at our contour example
pe "bat demo-apps/contour.yaml"
wait
clear
prompt Lets look at our redis example
pe "bat demo-apps/redis.yaml"
wait
clear
prompt Lets look at our nginx example
pe "bat demo-apps/nginx.yaml"
wait
clear
prompt Lets look at our simple app example
pe "bat demo-apps/simple-app.yaml"
wait
clear
prompt Lets look at the diff for deploying our simple app to a second cluster without kapp controller installed
pe "diff --color demo-apps/simple-app.yaml demo-apps/simple-app-cls-02.yaml"
wait
clear
prompt Lets check out our simple app
pe "curl http://simple-app.default.svc.cluster.local | tidy -xml -quiet | bat"
wait
clear
slides slides/summary.md
