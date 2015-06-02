# ABET Outcomes

Track ABET outcomes for various departments.

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using rails server:

    % rails server

## Deployment

Deployment uses Capistrano and requires a couple pre-requisites. First, add the
following to `~/.ssh/config`

    Host outcomes
      HostName outcomes.mit.edu
      User root
      GSSAPIAuthentication yes
      GSSAPIKeyExchange yes
      GSSAPIDelegateCredentials yes
      GSSAPITrustDNS yes

Additionally, deployment requires an existing kerberos ticket:

    % kinit <username>@athena.mit.edu

With that in place, you can deploy with:

    % cap production deploy

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
