{% from "sssd/map.jinja" import sssd_settings as sssd with context %}

sssd_package:
  pkg.{{ sssd.package_status }}:
    - name: {{ sssd.package_name }}

