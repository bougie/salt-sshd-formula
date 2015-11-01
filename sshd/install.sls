{% from "sshd/default.yml" import lookup with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('sshd:lookup')) %}

{% if lookup.package is defined %}
sshd_package:
    pkg.installed:
        - name: {{lookup.package}}
{% endif %}
