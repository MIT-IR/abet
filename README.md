# ABET Outcomes

[![Circle CI](https://circleci.com/gh/MIT-IR/abet.svg?style=svg)](https://circleci.com/gh/MIT-IR/abet)

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

To run the tests, you will need to have Chrome and chromedriver installed. On OS
X, you can install chromedriver with:

    % brew install chromedriver

## Deployment

Deployment uses Capistrano and requires a couple pre-requisites. First, add the
following to `~/.ssh/config`:

    Host outcomes
      HostName outcomes.mit.edu
      User root
      GSSAPIAuthentication yes
      GSSAPIKeyExchange no
      GSSAPIDelegateCredentials yes
      GSSAPITrustDNS yes

Additionally, deployment requires an existing kerberos ticket:

    % kinit <username>@ATHENA.MIT.EDU

If the above fails with a message that the athena realm cannot be found, you may
need the following kerberos configuration in `etc/krb5.conf`:

    [libdefaults]
        default_realm = ATHENA.MIT.EDU

    [realms]
        ATHENA.MIT.EDU = {
            kdc = kerberos.mit.edu
            kdc = kerberos-1.mit.edu
            admin_server = kerberos.mit.edu
        }

Once you have a kerberos ticket, you can deploy with:

    % cap production deploy

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
