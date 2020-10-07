#!/bin/bash

chmod a+x /opt/docker/bin/entrypoint.sh
/opt/docker/bin/entrypoint.sh "supervisord"