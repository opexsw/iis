#
# Author:: Kristian Vlaardingerbroek (<kvlaardingerbroek@schubergphilis.com>)
# Cookbook Name:: iis
# Recipe:: mod_iis6_metabase_compat
#
# Copyright 2013, Schuberg Philis B.V.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'iis'

features = if Opscode::IIS::Helper.older_than_windows2008r2?
             %w(Web-Mgmt-Compat Web-Metabase)
           else
             %w(IIS-IIS6ManagementCompatibility IIS-Metabase)
           end

features.each do |f|
  windows_feature f do
    action :install
  end
end
