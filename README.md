# CI285
Introduction to Functional Programming Web App Assignment<br>

To launch the web app you will need **Yesod Framework** installed on your machine.<br>
Follow this link http://www.yesodweb.com/page/quickstart which contains few simple<br>
steps on how to setup **Yesod**.<br><br>

Once **Yesod** is ready, you can launch the web app in two ways.<br>
First way is by launching a development server meant for testing purposes,<br>
to do that, using command prompt, you need to navigate into the top level of<br>
the folder where pulled web app folders like "Handler" and files are located<br>
and execute a following command, it will launch the app on **localhost:3000**.<br>

```cmd
yesod devel
```

Second way is building the app by compiling it into executable, after its compiled you<br>
will need a server software to launch the executable and your executable must be acompanied<br>
when deploying, with folders config/ and static/. To build the app you need to be at the<br>
top level folder via command prompt, where pulled files are located and execute the following<br>
commands:<br>

```cmd
cabal clean
cabal configure
cabal build
```
