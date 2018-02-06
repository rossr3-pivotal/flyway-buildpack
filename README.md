# flyway-buildpack

Downloads and makes flyway available in a folder to be easily called from your application. 

For Windows:

cf push myApp -s windows2016 -m 512m --no-start -b binary_buildpack
cf v3-push myApp -b https://github.com/rossr3-pivotal/flyway-buildpack.git -b hwc_buildpack

For Linux Cells:

cf push myApp -m 512m --no-start -b binary_buildpack 
cf v3-push myApp -b https://github.com/rossr3-pivotal/flyway-buildpack.git -b <your buildpack>


