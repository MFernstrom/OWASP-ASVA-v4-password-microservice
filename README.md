# OWASP-ASVA-v4-password-microservice

A microservice OWASP ASVAv.4 2.1.1 and 2.1.7 checks for passwords length and commonality implemented in FreePascal

# What does 2.1.1 and 2.1.7 specify?
## 2.1.1
Passwords must be 12 characters or longer

## 2.1.7
Passwords should not be among common passwords.

I chose to use the top 10,000 passwords list from https://github.com/danielmiessler/SecLists

# How to use the microservice
Run the application, make sure the password list is in the same directory as the executable.

Endpoint is available at `/api/password` on port `9080`, for example `http://localhost:9080/api/password` by making an HTTP FORM POST with a form key 'password' and the password to check as the value.

# How to build
Project is set up to build to "Default" (IE. the system you're building) if you want to cross-compile I recommend FPCUpDeluxe to easily set up your Lazarus/FPC environment.

Build as normal, project has Debugging output turned off and optimizations set for -O1

## Created with
Lazarus 2.1.0
FPC 3.3.1

## License
Project is licensed MIT to follow the SecList password list licensing.
