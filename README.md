<p align="left"><img src="./mindslice-logo.png" alt="Mindslice" width="90"></p>

# Mindslice

**Give your AI coding agents the context they need, across projects.**

Mindslice helps you organize useful knowledge and bring the right context to
your projects and AI coding agents. Search, read, and reuse that knowledge
across projects.

## Get started

On macOS or Linux, install the Mindslice CLI with Homebrew:

```sh
brew install mindsliceai/tap/mindslice
```

### 1. Start the local service

Run this from any directory:

```sh
mindslice service start
```

The service manages your homebase and project connections and keeps local
context views up to date. It runs in the background, even after you close the
terminal. Start it before using the setup commands below; stop it when needed
with `mindslice service stop`. For a Homebrew-managed service, stopping it also
disables automatic startup; turn that back on with `mindslice settings`.

### 2. Set up your homebase

Run this from any directory:

```sh
mindslice init /path/to/knowledge
```

Choose an existing homebase to register, initialize a new one, or clone an
approved Git URL. Prompts guide initialization and cloning; relative paths are
resolved from your current directory. The supplied directory must already
exist; when cloning, the CLI creates a new child directory inside it.

This registers the homebase on your machine, not a particular application
project. Keep it in its own folder, separate from your application code, so
multiple projects can use the same knowledge. You only need to connect each
homebase once per machine.

### 3. Set up your project

Change to the root of the application repository where you work with your
coding agent, **not** the homebase folder:

```sh
cd /path/to/your-project
mindslice init .
```

The `.` means the current directory. Choose which connected homebases
this project should use, review the project setup, and follow the prompts for
which knowledge to include. You can also install optional agent instructions,
skills, and reminder hooks.

Repeat this step in each project that needs access to your knowledge. If you
use Git, review and commit `.mindslice/project.json`, `.mindslice/.gitignore`,
and any agent integration files you choose to keep. Do not commit generated
`.mindslice/context/` files.

### 4. Explore your knowledge

From the initialized project directory:

```sh
mindslice status
mindslice knowledge tree
mindslice reader
```

Check the connection status, list the knowledge selected for this project, or
open the URL printed by `mindslice reader` to browse it locally.

Run `mindslice --help` for more options. To upgrade:

```sh
brew upgrade mindslice
```

For other platforms, download an archive from
[Mindslice Releases](https://github.com/mindsliceai/mindslice-releases/releases).
