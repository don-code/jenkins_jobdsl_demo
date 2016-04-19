/*
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import groovy.json.JsonSlurper

job('Hello') {
        scm {
                git('http://localhost:8000/root/hello.git')
        }
        triggers {
                scm('* * * * *')
        }
        steps {
                shell('./hello.sh')
        }
        publishers {
                mailer('nobody@whocares.com', false, true)
        }
}

def branches = new JsonSlurper().parse(new URL('https://api.github.com/repos/apache/commons-lang/branches').newReader())
branches.each { branch ->
        mavenJob("commons-lang (${branch.name})") {
                scm {
                        git('https://github.com/apache/commons-lang.git', branch.name)
                }
                goals('clean install')
        }
}
