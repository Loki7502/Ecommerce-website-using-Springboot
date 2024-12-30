<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>Sign Up - Ecom Webpage</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
            max-width: 600px;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: #343a40;
            text-align: center;
        }

        .form-text {
            font-size: 0.9rem;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .form-control {
            border-radius: 5px;
        }

        .linkControl {
            color: #007bff;
        }

        .linkControl:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>Sign Up Now</h3>
    <p class="text-center text-muted">Please fill out the form below to register</p>
    <form action="newuserregister" method="post">
        <div class="form-group">
            <label for="firstName">User Name</label>
            <input type="text" name="username" id="firstName" required placeholder="Your Username*"
                   class="form-control form-control-lg">
        </div>
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" class="form-control form-control-lg" required minlength="6" placeholder="Email*"
                   name="email" id="email" aria-describedby="emailHelp">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control form-control-lg" required placeholder="Password*" required name="password"
                       id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*?[~!@#$%\^&*()\-_=+[\]{};:\x27.,\x22\\|/?><]).{8,}" title="Must contain: 
                       at least one number, one uppercase letter, one lowercase letter, one special character, and 8 or more characters" required>
            <div class="mt-2">
                <input type="checkbox" onclick="showPassword()"> Show Password
            </div>
        </div>
        <div class="form-group">
            <label for="Address">Address</label>
            <textarea class="form-control form-control-lg" rows="3" placeholder="Enter Your Address"
                      name="address"></textarea>
        </div>
        <div class="text-center">
            <span>Already have an account? <a class="linkControl" href="index">Login here</a></span>
        </div>
        <div class="mt-4">
            <input type="submit" value="Register" class="btn btn-primary btn-lg btn-block">
        </div>
    </form>
</div>

<script>
    function showPassword() {
        var x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>
