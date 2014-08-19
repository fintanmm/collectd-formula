{% from "collectd/map.jinja" import collectd with context %}

{{ collectd.plugindirconfig }}/df.conf:
  file.managed:
    - source: salt://collectd/files/df.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        Devices: {{ salt['pillar.get']('collectd:plugins:df:Device') }}
        MountPoints: {{ salt['pillar.get']('collectd:plugins:df:MountPoint') }}
        FSTypes: {{ salt['pillar.get']('collectd:plugins:df:FSType') }}
        IgnoreSelected: {{ salt['pillar.get']('collectd:plugins:df:IgnoreSelected', 'false') }}
        ReportByDevice: {{ salt['pillar.get']('collectd:plugins:df:ReportByDevice', 'false') }}
        ReportReserved: {{ salt['pillar.get']('collectd:plugins:df:ReportReserved', 'false') }}
        ReportInodes: {{ salt['pillar.get']('collectd:plugins:df:ReportInodes', 'false') }}
