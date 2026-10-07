# Positron

This is a proof of concept workspace that leverages the [Jupyter Positron Server](https://github.com/posit-dev/jupyter-positron-server) package from Posit.
Unfortunately, due to Positron being a memory intensive IDE, it is not suitable for usage in PrairieLearn due to the memory limitations impose for each
workspace runner.

Positron server is a licensed software. You must request a license for the software and store the `license.lic` within the `clientFilesQuestion` of the
workspace question for this to launch. Note, this means the license is accessible to students from the workspace and can be a security risk for the file.

## Example Question Files

```html
<pl-question-panel>
  <p>Use Positron in the workspace below.</p>
</pl-question-panel>

<pl-external-grader-results></pl-external-grader-results>
<pl-workspace></pl-workspace>
```

```json
{
  "uuid": "5d6e57c0-05b6-4ec4-a50e-80ce0d147c87",
  "type": "v3",
  "title": "Positron workspace",
  "topic": "Workspace",
  "tags": ["workspace"],
  "singleVariant": true,
  "workspaceOptions": {
    "image": "zacwarham/jupyter-positron:latest",
    "port": 8080,
    "home": "/home/jovyan",
    "rewriteUrl": false,
    "gradedFiles": ["Workbook.ipynb"],
    "enableNetworking": false
  },
}
```

```python
def generate(data):
    data["params"]["_workspace_files"] = [
        {
            "name": ".positron/license.lic",
            "questionFile": "clientFilesQuestion/license.lic",
        },
    ]
```
