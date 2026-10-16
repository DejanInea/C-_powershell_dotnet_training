# Architecture overview

## Context

Users, external systems, trust boundaries, and scope.

## Structure

List components and responsibilities. Link a context/container diagram.
Label diagram arrows and describe what each arrow means.

## Dependencies and composition

Which source projects reference which? Where are implementations chosen?
Which policies remain independent of storage, presentation, and frameworks?

## Runtime flow

Trace one successful request and two failure paths, including side effects.

## Data and contracts

Ownership, field rules, identifiers, storage format, compatibility.
State concurrency assumptions and transaction requirements.

## Quality and operations

Validation boundaries, sensitive data, logging, backup, deployment, rollback.

## Tradeoffs

Link ADRs. What does the current structure make easier or harder?

## Review triggers

What evidence would cause you to revisit these decisions?
