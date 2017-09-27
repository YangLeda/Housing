<%--
  Created by IntelliJ IDEA.
  User: Yang
  Date: 27/9/17
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Register</title>
</head>
<body>
<center>
    <h1>Create an account</h1>
    <form method="post" action="register_process">
        <table>
            <tr>
                <td>Email</td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password"> The password must be less than 6 digits</td>
            </tr>
            <tr>
                <td>Full name</td>
                <td><input type="text" name="fullname"></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><input type="radio" name="gender" value="male">Male
                    <input type="radio" name="gender" value="Female">Femal
                </td>
            </tr>
            <tr>
                <td>Submit your photo ID</td>
                <td><input type="file"></td>
            </tr>

            <tr>
                <td><input type="submit" value="Submit"></td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>