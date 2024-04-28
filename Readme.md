# Project Setup Instructions

Follow these steps to set up the project:

1. **Clone the Repository:**

```sh
git clone https://github.com/upekshaip/jsp-web-project.git
```

2. **Open the Project with Apache NetBeans:**
   Open the project using Apache NetBeans IDE.

3. **Resolve Dependencies:**

- Add the JDBC connector for the project. Navigate to the `App` folder and locate the `web` folder. Set the JDBC connector path to `App/web/WEB-INF/lib/mysql-connector-j-8.3.0.jar`.

4. **Configure Tomcat Server (if not added):**
   If Tomcat server is not added, include its path (commonly `C:\xampp\tomcat`).

5. **Change Database Port Number:**

- In the `Source` package, navigate to the `Config` package and open `Config.java` class file.
- If you open XAMPP, start MySQL, and find the port number displayed.
- Open the Config.java class file located in the Source package > Config package.
- Locate the line `String PORT = "3306";` and replace "3306" with the port number you found.

6. **Database Setup:**

- Access `localhost/phpmyadmin` and create a new database named `java_web`.
- Select the `java_web` database and navigate to the import section.
- Import the `java_web.sql` file and save, ensuring all database tables are imported.

7. **Run the Application:**
   Run your application after completing the above steps.
