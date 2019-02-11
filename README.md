# CTXfloods-frontend
Central Texas Floods Frontend

- [Set Up Development Environment](#set-up-development-environment)
- [Run Tests](#run-tests)
- [Run Storybook](#run-storybook)
- [Deployment Process](#deployment-process)
- [Development Tips](#development-tips)

## Set Up Development Environment
💾 [Install yarn](https://yarnpkg.com/en/docs/install)

👯 Clone the repo
```
git clone https://github.com/cityofaustin/ctxfloods
cd ctxfloods
yarn install
```

⌨️ Start the local server
```
yarn start-local
```

💾 Clone and install [CTXFloods-backend](https://github.com/cityofaustin/ctxfloods-backend)

🥂 Cheers! The frontend should now be up and running! Have fun clicking around!

## Run Tests
```
yarn test
```
If any storybook snapshots need updating, run `yarn test -u`

## Run Storybook
```
yarn storybook
```
<img src="/README/storybookrunning.png" align="middle" height="62" >
<img src="/README/storybookscreeny.png" align="middle" height="299" >

## Deployment Process
Branch promotion works like this:<br>
feature -> dev -> master

Create your feature branch as a branch off "dev". That feature branch will be merged into "dev", which will then be merged into "master."

CTXFloods uses TravisCI for continuous integration. Whenever you push to github, a TravisCI build will be triggered. By default this will only run the tests. If you want to deploy your feature branch on a git push, add the name of your feature branch to `deployment/devDeployConfig` with the option `deploy: true`. This will build a new S3 Bucket for your feature branch frontend. Subsequent pushes from the same branch will update this same bucket. If you want to connect it to a specific backend deployment, add the name of the backend branch under the `backend` option. Ex:
```
"195-camera": {
  deploy: true,
  backend: "195-camera"
}
```
If `deploy: true` is set without a specified backend, your frontend will point to the "dev" branch backend.

## Development Tips
+ 🔑 Some pages require a login:

   <img src="/README/login-to-frontend.png" align="middle" height="300" >

   📧 In case of such a page, you can log in as the default super admin user:
   * Email: superadmin@flo.ods
   * Password: texasfloods

   This password is set as `PG_SUPER_ADMIN_PW` in `/deployment/vars/local` in ctxfloods-**backend**.

+ If you added a new postgres migration file to the backend, regenerate the frontend's graphql schema file by running `yarn get-schema`
