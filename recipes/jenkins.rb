#
# Cookbook Name:: jenkins_jobdsl_demo
# Recipe:: jenkins
#
# Copyright 2016, don-code
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

package 'java-1.8.0-openjdk-devel'

include_recipe 'jenkins::master'

%w(git job-dsl).each do |plugin|
  jenkins_plugin plugin do
    notifies :restart, 'service[jenkins]', :delayed
  end
end

template "#{node['jenkins']['master']['home']}/hudson.tasks.Maven.xml" do
  source 'hudson.tasks.Maven.xml.erb'
  notifies :restart, 'service[jenkins]', :delayed
end

service 'jenkins' do
  action :nothing
end
