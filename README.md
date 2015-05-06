# CI285
Introduction to Functional Programming Web App Assignment<br>

To launch the web app you will need **Yesod Framework** installed on your machine.<br>
Follow this link which contains few simple steps on how to setup **Yesod**.<br><br>

Once **Yesod** is setup and ready, you can launch the web app in two ways.<br>
First way is by launching a development server, to do that, using command prompt, you need<br>
to navigate into the top level of the folder where pulled web app folders like "Handler" and<br>
files are located and execute a following command, it will launch the app on **localhost:3000**.

```cmd
yesod devel
```

Second way is deploying the app by compiling it into executable, after its compiled you<br>
will need a server software to launch the executable. To build the app you need to be at the<br>
top level folder via command prompt, where pulled files are located and execute the following<br>
commands:<br>

```cmd
cabal clean
cabal configure
cabal build
```
