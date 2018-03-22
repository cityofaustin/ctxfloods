export CURRENT_FLOODS_BRANCH_NAME=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

export S3_BUCKET=$(echo "ctxfloods-frontend-$CURRENT_FLOODS_BRANCH_NAME" | tr '[:upper:]' '[:lower:]')

tput bold 
echo "Please enter your AWS Credentials"
tput sgr0

echo "Access key ID:"
read AWS_ACCESS_KEY_ID
export AWS_ACCESS_KEY_ID
travis encrypt AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID --add

echo "Secret access key"
read -s AWS_SECRET_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY
travis encrypt AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY --add

echo "Floods Backend URL:"
read BACKEND_URL
export BACKEND_URL

export REACT_APP_GRAPHQL_ENDPOINT=$BACKEND_URL/graphql
export REACT_APP_XML_ENDPOINT=$BACKEND_URL/xml
export REACT_APP_EMAIL_ENDPOINT=$BACKEND_URL/email/reset

echo "  - CURRENT_FLOODS_BRANCH_NAME=$CURRENT_FLOODS_BRANCH_NAME" >> .travis.yml
echo "  - S3_BUCKET=$S3_BUCKET" >> .travis.yml
echo "  - REACT_APP_GRAPHQL_ENDPOINT=$REACT_APP_GRAPHQL_ENDPOINT" >> .travis.yml
echo "  - REACT_APP_XML_ENDPOINT=$REACT_APP_XML_ENDPOINT" >> .travis.yml
echo "  - REACT_APP_EMAIL_ENDPOINT=$REACT_APP_EMAIL_ENDPOINT" >> .travis.yml
