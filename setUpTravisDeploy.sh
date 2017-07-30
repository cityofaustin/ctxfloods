echo "Set AWS Credentials for Serverless"
pip install --upgrade --user awscli
aws configure
echo "Deploy to AWS to get a cloudformation/endpoint"
cd backend; yarn; yarn rebuild-and-deploy
