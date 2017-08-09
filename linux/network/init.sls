{%- from "linux/map.jinja" import network with context %}
include:
- linux.network.hostname
{%- if network.host|length > 0 %}
- linux.network.host
{%- endif %}
{%- if network.resolv is defined %}
- linux.network.resolv
{%- endif %}
{%- if network.persistent_net is defined %}
- linux.network.persistent_net
{%- endif %}
{%- if network.interface|length > 0 %}
- linux.network.interface
{%- endif %}
- linux.network.proxy
