export CURRENT_FLOODS_BRANCH_NAME=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

export npm_config_PGCON=""
export npm_config_PGRUNCON=""

pip install --upgrade --user awscli

tput bold 
echo "Please enter your AWS Credentials"
tput sgr0

aws configure

tput bold 
echo "Deploying to AWS to get a cloudformation/endpoint"
tput sgr0

cd backend
yarn
sls deploy -v > out.tmp
export PGENDPOINT=$(grep "pgEndpoint" out.tmp | cut -f2- -d: | cut -c2-)
rm out.tmp

tput bold 
echo "Setting PGCON and PGRUNCON"
tput sgr0

export npm_config_PGCON=$(echo postgresql://example:serverless@$PGENDPOINT:5432/floods)
export npm_config_PGRUNCON=$(echo postgresql://floods_postgraphql:xyz@$PGENDPOINT:5432/floods)

tput bold 
echo "Deploying to AWS"
tput sgr0

yarn rebuild-and-deploy
