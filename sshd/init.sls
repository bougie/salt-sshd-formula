# Meta-state to fully sshd

include:
    - sshd.install
    - sshd.config
    - sshd.service

extend:
    sshd_service:
        service:
            - watch:
                - file: sshd_config
                - pkg: sshd_package
            - require:
                - file: sshd_config
    sshd_config:
        file:
            - require:
                - pkg: sshd_package
