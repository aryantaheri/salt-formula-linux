{% from "linux/map.jinja" import network with context %}
{% if network.enabled %}

{% if network.persistent_net is defined %}
udev_persist_interface_name:
  file.managed:
    - name: /etc/udev/rules.d/70-persistent-net.rules
    - source: salt://linux/files/70-persistent-net.rules
    - template: jinja

udev_trigger:
  cmd.run:
    - name: 'udevadm trigger --type=devices --action=add'
    - onchanges:
        - file: /etc/udev/rules.d/70-persistent-net.rules
{% endif %}

{% endif %}
