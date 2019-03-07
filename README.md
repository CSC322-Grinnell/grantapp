## README ##

This is a simple grant application management service for Greater Poweshiek Community Foundation, deployed at
https://grant-app.herokuapp.com/

**Repository Properties**

- Ruby version: 2.3.0
- Rails version: 4.2.0

**AWS S3**

The application uses AWS S3 to store document files.

The AWS S3 credentials are stored in environment variables managed by the [Figaro gem](https://github.com/laserlemon/figaro). The credentials are stored in `config/application.yml`, and this file should never be commited to GitHub. The file is included in `.gitignore`, which will prevent it from being accidentally committed.

**Cloning and Configuration Instructions**
- Clone the repository at https://github.com/CSC322-Grinnell/grantapp
    - _It is advised that you create a development branch for easier version control_
- Set up the application
    ``` bin/setup ```
- Request access to the AWS S3 credentials and copy to `config/application.yml`
- At this point you should be able to run the website on the local rails server.
    ``` bin/rails server ```


In addition to the previous instructions, you will need to follow these steps to deploy to and securely talk to Heroku.
- Generate a public SSH key
    ``` ssh-keygen -t rsa ```
    Press 'enter' at the first prompt to use the default file location to save the key.
- Log in to your heroku account
    ``` heroku login ```
    Enter your heroku credentials when prompted.
    _A free heroku account can be created at https://heroku.com_
- Add your public key so that you can deploy code to your heroku apps
    ``` heroku keys:add ```
    and enter 'y' to add the key.
    You can check which keys are associated with your heroku account with
        ``` heroku keys ```
- Check if the heroku remote is there
    ``` git remote -v ```
- If there is no heroku remote (of the form:
                heroku  https://git.heroku.com/<heroku-name>.git (fetch)
                heroku  https://git.heroku.com/<heroku-name>.git (push))
        add a heroku remote
        ``` heroku git:remote -a <domain-name> ```
        for http://gpcf-grant-app.herokuapp.com/ this will be
        ``` heroku git:remote -a gpcf-grant-app ```
- Pull to make sure your branch is up-to-date.
    ``` git pull ```
- Push with
    ``` git push heroku master ```
    or
    ``` git push heroku yourbrach:master ```
    if you are on another branch.

**Running the test suite**
    ```
    rspec spec/
    ```

**Migrating Files**
    ```
    rake db:schema:load Runs the migration activity
    rake db:seed        Runs the seed data
    ```
will run all tests in the spec folder.