## ROUTE DOCUMENTATION

### 1. Sign-in_sign-up Routes (back)

---

| HTTP REQUEST | ROUTES               | DESCRIPTION                                                                                                                     |
| :----------- | :------------------- | :------------------------------------------------------------------------------------------------------------------------------ |
| POST         | /invite              | The route for invite ero user and alumni user but for sign up admin                                                             |
| GET          | /signin/{email}      | The route for use email to sign in and get two data to validate (status,role) and redirect to sign in step2                     |
| POST         | /signin/password     | The route for simple sign in after completed first sign in with**validated** email                                        |
| POST         | /signin/completeinfo | The route for use email to sign in and go to another information by comparing status and role that get on first step of sign in |
|              |                      |                                                                                                                                 |

### 2. Type Of User Routes (back)

| HTTP REQUEST | ROUTES                    | DESCRIPTION                                           |
| :----------- | :------------------------ | :---------------------------------------------------- |
| GET          | /users/ero                | The route for get all ero users                       |
| GET          | /users/alumni             | The route for get all alumni users                    |
| GET          | /users/{id}               | The route to get a user by role                       |
| GET          | /users/email/all          | The route to get all email of users                   |
| DELETE       | /users/{id}               | The route to remove a user                            |
| PUT          | /users/updateinfo/{id}    | The route for update alumni information (phone,email) |
| PUT          | /users/updateprofile/{id} | the route to update alumni profile                    |
|              |                           |                                                       |

### 3. Domain Company Routes (back)

| HTTP REQUEST | ROUTES                 | DESCRIPTION                                 |
| :----------- | :--------------------- | :------------------------------------------ |
| GET          | /domain_companies      | The route to get all the domains of company |
| GET          | /domain_companies/{id} | The route to get a domain of company        |
| POST         | /domain_companies      | The route to create a domain                |
| PUT          | /domain_companies/{id} | The route to update the domain              |
|              |                        |                                             |

### 4. Company Routes (back)

| HTTP REQUEST | ROUTES          | DESCRIPTION                     |
| :----------- | :-------------- | :------------------------------ |
| GET          | /companies      | The route to get all companies  |
| GET          | /companies/{id} | The route to get a company      |
| POST         | /companies      | The route to create a company   |
| PUT          | /companies/{id} | The route to update the company |
| DELETE       | /companies/{id} | The route to remove the company |

### 5. Skill Routes (back)

| HTTP REQUEST | ROUTES       | DESCRIPTION                 |
| :----------- | :----------- | :-------------------------- |
| GET          | /skills      | The route to get all skills |
| DELETE       | /slills/{id} | The route to get a skill    |
|              |              |                             |

### 6. Alumni Skill Routes (back)

| HTTP REQUEST | ROUTES               | DESCRIPTION                      |
| :----------- | :------------------- | :------------------------------- |
| POST         | /alumniskills/add    | The route to create alumni skill |
| POST         | /alumniskills/remove | The route to delete alumni skill |

### 7. Batch Routes

| HTTP REQUEST | ROUTES        | DESCRIPTION                      |
| :----------- | ------------- | -------------------------------- |
| GET          | /batches      | The route to get all batches     |
| POST         | /batches      | The route for create a new batch |
| DELETE       | /batches/{id} | The route to remove a batch      |

### 8. employment Routes

| HTTP REQUEST | ROUTES            | DESCRIPTION                        |
| ------------ | ----------------- | ---------------------------------- |
| GET          | /employments      | The route for get all employment   |
| GET          | /employments/{id} | The route to get an employment     |
| POST         | /employments      | The route to create new employment |
| PUT          | /employment/{id}  | The route for update an employment |
| DELETE       | /employment/{id}  | The route to remove an employment  |
