# Conformance Testing for Maintainers

## Introduction

Conformance testing is a crucial step in ensuring that applications submitted to
the Civo Kubernetes Marketplace are properly installed and functional. As a
maintainer, it's essential to understand the conformance testing process and how
to review these tests.

## What are Conformance Tests?

Conformance tests verify that an application is correctly installed and
operating as expected in the Civo Kubernetes environment. These tests check that
all components of the application are running and that the application is
accessible and functional.

## Triggering Conformance Tests

To trigger a conformance test for a pull request, you need to add the
`ready-to-test` label to the PR. This will initiate the conformance testing
workflow.

## Reviewing Conformance Tests

When reviewing conformance tests, ensure that they cover the following:

1. Verification of correct application installation according to `app.yaml` or `install.sh`.
2. Verification that all application components are running.
3. Verification that the application is accessible and functional.
