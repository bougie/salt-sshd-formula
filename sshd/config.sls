{% from "sshd/default.yml" import lookup, rawmap with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('sshd:lookup')) %}

sshd_config:
    file.managed:
        - name: {{lookup.config_file}}
        - source: salt://sshd/files/sshd_config.j2
        - template: jinja
        - user: root
        {% if salt['grains.get']('os') == 'FreeBSD' %}
        - group: wheel
        {% else %}
        - group: root
        {% endif %}
        - mode: 0644
