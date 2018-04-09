# flyway-buildpack

Downloads and makes [flyway](https://flywaydb.org/) available in a folder to be easily called from your application. 

For Windows:

```powershell
cf push myApp -s windows2016 -m 512m --no-start -b binary_buildpack
cf v3-push myApp -b https://github.com/rossr3-pivotal/flyway-buildpack.git -b hwc_buildpack
```

For Linux:

```bash
cf push myApp -m 512m --no-start -b binary_buildpack 
cf v3-push myApp -b https://github.com/rossr3-pivotal/flyway-buildpack.git -b "your last buildpack"
```

The buildpack sets the environment variable PCF_FLYWAY_BINDIR to point to the folder where the flyway app is located.

You would then call flyway from your application using 

For Windows: 

```bash
$PCF_FLYWAY_BINDIR/flyway [options] [command]
```

For Linux:

```powershell
%PCF_FLYWAY_BINDIR%\flyway [options] [command]
```

See the [flyway documentation](https://flywaydb.org/documentation/) for more details 


