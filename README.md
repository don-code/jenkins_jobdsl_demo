jenkins\_jobdsl\_demo Cookbook
============================

This cookbook sets up an environment suitable for demonstrating several integrations with the Jenkins Job DSL plugin. It installs and sets up Jenkins, Gitlab, Git, and Maven. It was written specifically for a [talk given at the Boston Jenkins Area Meetup](http://www.meetup.com/Boston-Jenkins-Area-Meetup/events/229475277/) on April 21st, 2016.

Requirements
------------

#### Cookbooks
* `jenkins`, for installing Jenkins.
* `maven`, for installing Maven.

#### Environment
For those with Vagrant installed, running `./provision.sh` will set up a Vagrant VM running CentOS 6.7 with the appropriate port forwarding rules configured for an effective demonstration. Gitlab will be available on port 8000; Jenkins will be available on port 8080 (port 8081 on the VM).

Note that Gitlab's root user password is set to '5iveL!fe'. Jenkins is configured without authentication.

Attributes
----------

* `node['jenkins_jobdsl_demo']['gitlab']` determines what RPM package to download and install Gitlab from.

Recipes
-------
#### jenkins\_jobdsl\_demo::default

Runs the `gitlab`, `jenkins`, and `tools` recipes.

#### jenkins\_jobdsl\_demo::gitlab

Installs Gitlab from an RPM, and sets it up to run on port 8000.

#### jenkins\_jobdsl\_demo::jenkins

Installs Jenkins using the `jenkins` cookbook, sets up the Git and Job DSL plugins, and configures Maven support on the server. Also installs a JDK as a requirement.

#### jenkins\_jobdsl\_demo::tools

Installs Maven and Git.

Examples
--------

Several example Jenkins Job DSL scripts are included in the `examples` directory:

1. Hello World: demonstrates running a shell build step.
1. Hello from Git: demonstates running the file `hello.sh` from a Git repository.
1. Poll Git: demonstrates polling Git for changes every minute, running `hello.sh` when changes are derected.
1. Flame on Fail: demonstrates sending an e-mail to both `nobody@whocares.com` and the committer on a Git commit which makes the job fail.
1. Commons: demonstrates building a Maven project from Git, in this case Apache Commons Lang.
1. Commons Branches: demonstrates retrieving a list of branches from the GitHub API and genreating build jobs for each one.
1. View: demonstrates creating a view to filter in Apache Commons Lang projects only.  

License
-------
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public Licensealong with this program.  If not, see <http://www.gnu.org/licenses/>.
