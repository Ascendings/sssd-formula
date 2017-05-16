{% from "sssd/map.jinja" import sssd_settings as sssd with context %}

sssd_package:
  pkg.{{ sssd.package_status }}:
    - name: {{ sssd.package_name }}

{% if sssd.package_extras %}
sssd_package_extras:
  pkg.installed:
    - pkgs: {{ sssd.package_extras|json }}
{% endif %}

