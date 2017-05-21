{% from "sssd/map.jinja" import sssd_settings as sssd with context %}

sssd_package:
  pkg.{{ sssd.package_status }}:
    - name: {{ sssd.package_name }}

{% if sssd.package_extras %}
sssd_package_extras:
  pkg.installed:
    - pkgs: {{ sssd.package_extras|json }}
{% endif %}

sssd_config:
  file.managed:
    - name: {{ sssd.config_path }}
    - require:
      - pkg: sssd_package

sssd_service:
  service.{{ sssd.service_status }}:
    - name: {{ sssd.service_name }}
    - require:
      - file: sssd_config

