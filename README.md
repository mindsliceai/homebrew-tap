# Mindslice Homebrew tap

This tap distributes the Mindslice CLI from public release archives in
[`mindsliceai/mindslice-releases`](https://github.com/mindsliceai/mindslice-releases).
The application source repository remains private.

## Install and upgrade

After the first release formula pull request has been reviewed and merged:

```sh
brew install mindsliceai/tap/mindslice
brew upgrade mindslice
```

The private application repository's release workflow tests and builds the
platform bundles, publishes them with SHA-256 checksums to the public releases
repository, then opens a pull request updating this tap's formula. Merge that
pull request after the formula checks pass.
To publish an already-existing release as the initial formula, use the Release
workflow's manual dispatch and provide its stable `vMAJOR.MINOR.PATCH` tag.

## Initial setup

Create public GitHub repositories `mindsliceai/homebrew-tap` and
`mindsliceai/mindslice-releases`, each with an initialized default branch. The
releases repository needs a default-branch commit so GitHub can create version
tags for its releases. The first successful application release creates the
initial formula pull request; there is no installable formula until that pull
request is merged.

For cross-repository automation, create a GitHub App installed on
`mindsliceai/mindslice-releases` and `mindsliceai/homebrew-tap`, with
**Contents: read and write** and **Pull requests: read and write** permissions.
Add these repository secrets to the private `mindsliceai/mindslice`
application repository:

- `HOMEBREW_RELEASE_APP_ID`
- `HOMEBREW_RELEASE_APP_PRIVATE_KEY`

The app publishes public archives to the releases repository and opens
formula-update pull requests in the tap. The tap's formula workflow audits,
installs, and tests each update on macOS and Linux before it is merged.
