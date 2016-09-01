
{% if grains['oscodename']=="trusty" %} 
nodejs.ppa:
  pkgrepo.managed:
    - humanname: node.js PPA
    - name: deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu {{ grains['oscodename'] }} main
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/nodejs.list
    - keyid: "C7917B12"
    - keyserver: keyserver.ubuntu.com
    - require_in:
      pkg: nodejs

nodejs:
  pkg.installed:
    - name: nodejs
    - require:
      - pkgrepo: nodejs.ppa

less:
  npm.installed:
    - require:
      - pkg: nodejs

{% elif grains['oscodename']=="xenial" %} 


nodejs:
  pkg.installed:
    - name: nodejs

less:
  npm.installed:
    - name: npm

{% endif %}
