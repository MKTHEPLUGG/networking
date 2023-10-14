Yes, this order seems more logical. You're essentially performing these steps:

1. Checking out the code and setting up your environment.
2. Authenticating with Azure.
3. Using GitVersion to determine the version.
4. Replacing tokens in your parameters file.
5. Validating the deployment with `what-if`.
6. Preparing and creating the artifacts from your templates and parameters.
7. Uploading and then downloading the artifact to the current workspace (though I must mention, if you're not passing artifacts between jobs or workflows, this step is redundant — you're uploading and immediately downloading what you just created).
8. Adjusting the `using` directive in the downloaded parameters file to match the directory structure you're working with.
9. Deploying using the artifact.

It looks like you've placed the "Adjust using directive in parameters file" step correctly before deploying with the artifact.

Give it a try and see if this resolves the discrepancy and deployment error you were facing.