# OWASP ASVA v4 Password Microservice

To quote the page itself [OWASP ASVA](https://owasp.org/www-project-application-security-verification-standard/): The OWASP Application Security Verification Standard (ASVS) Project provides a basis for testing web application technical security controls and also provides developers with a list of requirements for secure development.

This project is a microservice that lets you easily check if a password passes the OWASP ASVAv.4 2.1.1 and 2.1.7 definitions.

# What are the 2.1.1 and 2.1.7 definitions?
## 2.1.1
2.1.1 states that a password must be 12 characters or longer

## 2.1.7
2.1.7 states that passwords should not be among common passwords.

I chose to use the top 10,000 passwords list from https://github.com/danielmiessler/SecLists as I figure it's big enough to be useful while small enough to be quickly used.

# How to use the microservice
Download the release for your platform, there are releases for Windows, Linux, and MacOS. All are built for x64.

## Linux and Mac
For Linux and Mac you may need to make it executable after unzipping with `chmod +x x86_64-linux-ASVAv4PasswordMicroservice` and to run it you just do `./x86_64-linux-ASVAv4PasswordMicroservice`

## Windows
Unzip and double click or run from the commandline.

## Changing default port
The default port is 9080. You can change what port the service listens to by adding it to the launch command.

Example: `./x86_64-linux-ASVAv4PasswordMicroservice 6000` to run on port 6000.

## Accessing the service
Endpoint is available at `/api/password` on port `9080` by default. Example `http://localhost:9080/api/password` by making an HTTP FORM POST with a form key `password` and the password to check as the value.

# Building it
Built with versions
* Lazarus 2.1.0
* FPC 3.3.1

Project is set up with build-modes for Linux, Windows, and Mac, adjust as needed.

## License
Project is licensed MIT to follow the SecList password list licensing.
