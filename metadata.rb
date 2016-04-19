name             'jenkins_jobdsl_demo'
maintainer       'don-code'
license          'GPL v3'
description      'Installs Jenkins and Gitlab, suitable for demoing the Job DSL plugin.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'jenkins'
depends 'maven'
