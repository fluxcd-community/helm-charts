# Contributing Guidelines

Contributions are welcome via GitHub pull requests. This document outlines the process to help get your contribution accepted.

## Sign off Your Work

The Developer Certificate of Origin (DCO) is a lightweight way for contributors to certify that they wrote or otherwise have the right to submit the code they are contributing to the project. Here is the full text of the [DCO](http://developercertificate.org/). Contributors must sign-off that they adhere to these requirements by adding a `Signed-off-by` line to commit messages.

```text
This is my commit message

Signed-off-by: Random J Developer <random@developer.example.org>
```

See `git help commit`:

```text
-s, --signoff
    Add Signed-off-by line by the committer at the end of the commit log
    message. The meaning of a signoff depends on the project, but it typically
    certifies that committer has the rights to submit this work under the same
    license and agrees to a Developer Certificate of Origin (see
    http://developercertificate.org/ for more information).
```

## How to Contribute

1. Fork this repository, develop, and [test your changes](#tests-and-documentation-updates)
1. Remember to run helm-doc (see the Makefile) and helm-changelog (as last command)
1. Submit a pull request

### Technical Requirements

* Must pass [DCO check](#sign-off-your-work)
* Must pass CI jobs for linting and installing changed charts with the [chart-testing](https://github.com/helm/chart-testing) tool
* Any change to a chart requires a version bump following [semver](https://semver.org/) principles. See [Immutability](#immutability) and [Versioning](#versioning) below

Once changes have been merged, the release job will automatically run to package and release changed charts.

### Tools

* helm
* k8s cluster for tests (eg Docker Desktop with k8s or Kind cluster)
* helm-docs ( https://github.com/norwoodj/helm-docs/ )
* helm unittests ( helm plugin install https://github.com/quintush/helm-unittest )

### Tests and documentation updates

* Make your changes
* run: ```helm install --dry-run charts/flux2/ --generate-name```
* run: ```helm unittest --helm3 --file tests/*.yaml --file 'tests/**/*.yaml' charts/flux2/```
    * add ```-u``` if you need to update the compare snapshot in \_\_snapshots\_\_
* bump chart version if necessary
* run: ```make helmdocs```
* squash all commits
* run: `make reviewable`

### Immutability

Chart releases must be immutable. Any change to a chart warrants a chart version bump even if it is only changed to the documentation.

### Versioning

The chart `version` should follow [semver](https://semver.org/).

### Community Requirements

By participating in this project you agree to abide by its terms.
See [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md).