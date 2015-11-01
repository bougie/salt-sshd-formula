{% from "sshd/default.yml" import lookup, rawmap with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('sshd:lookup')) %}

sshd_service:
    service:
        - running
        - name: {{lookup.service}}
