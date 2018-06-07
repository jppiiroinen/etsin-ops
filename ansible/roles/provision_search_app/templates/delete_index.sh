#!/bin/bash
# Script to reindex all datasets in Elasticsearch without recreating index

if [ "$USER" != "{{ app_user }}" ]; then
    echo "Run this as {{ app_user }}"
    exit 1
fi

sudo chown -R {{ app_user }}:etsin {{ search_app_log_base_path }}
source {{ python_virtualenv_path }}/bin/activate
cd {{ search_app_base_path }}
python delete_index.py
