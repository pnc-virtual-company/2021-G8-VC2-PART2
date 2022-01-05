# RUN PROJECT ON DEVELOMENT

## BACK

- On php MyAdmin, create a new database : alumni_db
- Import database name(alumni_db) on your database (if you want our data)
- Go to /back
- Copy the .env.example to .env
- on .env file, update the database name :
  DB_DATABASE=alumni_db
- Launch composer install
- Launch npm install
- Launch php artisan migrate
- Launch php artisan key:generate
- Launch php artisan storage:link ( to allow the image folder to be public)
- Launch php artisan serve
- To set up ADMIN user on your data
- + Http request  POST  and  http://127.0.0.1:8000/api/invite
  + Go to your Thurnder Client and Go to Headers input Accept apllication/json
  + Go to Body then Form and complete the fill information
  + firstname , lastname, email, password, role

## FRONT

- Go to /front
- Launch npm install
- Run npm run serve to launch on developpment mode
- Run npm i --save axios to install and progress axios on project

# RUN PROJECT ON PRODUCTION

First time :

```
- Clone project

- On php MyAdmin, create a  new database : alumni_db
- Import database name(alumni_db) on your database (if you want our data)

- Go to /back
- Copy the .env.example to .env
- on  .env file, update the database name :
	DB_DATABASE=alumni_db

- Launch  composer install
- Launch  npm install
- Launch php artisan migrate
- Launch  php artisan key:generate

- Go to /front
- Launch  npm install
```

## Other times :

```
- git pull

- Go to /front
- Run npm run build
```
