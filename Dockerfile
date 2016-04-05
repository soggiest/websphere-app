# (C) Copyright IBM Corporation 2015.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM websphere-liberty:common

COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/
RUN installUtility install --acceptLicense defaultServer \
    && rm -rf /opt/ibm/wlp/usr/servers/defaultServer/workarea

RUN wget https://archive.ubuntu.com

RUN grep -h ^deb /etc/apt/sources.list

RUN /usr/bin/apt-get install subversion

RUN svn co https://svn.apache.org/repos/asf/openjpa/trunk/openjpa-examples/openbooks
