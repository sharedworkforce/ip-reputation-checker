# Check IP reputation demo app

This app uses Shared Workforce to check the reputation of an IP address using the AOL postmaster site.

## Installation

```
$ git clone git@github.com:sharedworkforce/ip-reputation-checker.git
$ cd ip-reputation-checker
$ bundle install
$ rake db:setup
```

## Usage

Create a host and post a task with:

```
$ SHAREDWORKFORCE_API_KEY=xxx-xxx-xxx rails c
Loading development environment (Rails 4.0.0)
2.0.0-p0 :001 > Host.create(:ip_address => '8.8.8.8')
```

Collect responses:

```
$ SHAREDWORKFORCE_API_KEY=xxx-xxx-xxx rake sw:collect
```

Expected response:

```
=> Please note: expect a delay of about 30 seconds after a task is completed before seeing a response.
=> This gives the worker a chance to change their answer.
=> Connecting to Shared Workforce...
=> Get IP reputation (2474232) complete. Loading responses.
Shared Workforce: processing responses for Get IP reputation
=> Done.

```
