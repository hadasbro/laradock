#!/bin/bash

for dir in ./*/;
do

  dir=${dir%*/};

  COMPOSER_JSON="$dir/composer.json"
  PACKAGE_JSON="$dir/package.json"
  BOWER_JSON="$dir/bower.json"
  REQUIREMENTS_TXT="$dir/requirements.txt"

  if [[ "$dir" == "./laradock"  ]]; then
    continue
  fi

  # COMPOSER DEPENDENCIES
  if [[ $ENV_COMPOSER_PROJECT_INSTALL = true && -f "$COMPOSER_JSON" ]]; then
    # shellcheck disable=SC2164
    cd "$dir"
    composer install --prefer-dist --no-scripts;
    echo "COMPOSER DEPENDENCIES Autoinstall"
  fi


  # YARN DEPENDENCIES
  if [[ $ENV_YARN_PROJECT_INSTALL = true && -f "$PACKAGE_JSON" ]]; then

    if [[ $ENV_INSTALL_NODE = false || $ENV_INSTALL_YARN = false ]]; then
      echo "Automatic Yarn packages installation (YARN_PROJECT_INSTALL) require also Node and Yarn installed (ENV_INSTALL_NODE, ENV_INSTALL_YARN). Operation failed.";
    else
      # shellcheck disable=SC2164
      cd "$dir"
      yarn install --ignore-engines --ignore-optional
      echo "YARN DEPENDENCIES Autoinstall"
    fi

  fi

  # BOWER DEPENDENCIES
  if [[ $ENV_BOWER_PROJECT_INSTALL = true && -f "$BOWER_JSON" ]]; then

    if [[ $ENV_INSTALL_NODE = false || $ENV_INSTALL_BOWER = false ]]; then
      echo "Automatic Bower packages installation (BOWER_PROJECT_INSTALL) require also Node and Bower installed (INSTALL_NODE, INSTALL_BOWER). Operation failed.";
    else
      # shellcheck disable=SC2164
      cd "$dir"
      bower install --allow-root
      echo "BOWER DEPENDENCIES Autoinstall"
    fi

  fi

  # PIP DEPENDENCIES
  if [[ $ENV_PIP_PROJECT_INSTALL = true && -f "$REQUIREMENTS_TXT" ]]; then

    if [[ $ENV_INSTALL_PYTHON = false ]]; then
      echo "Automatic packages installation (PIP_PROJECT_INSTALL) require also Python installed (INSTALL_PYTHON). Operation failed.";
    else
      # shellcheck disable=SC2164
      cd "$dir"
      pip install -r requirements.txt
      echo "PIP DEPENDENCIES Autoinstall"
    fi
  fi

  # PIP DEPENDENCIES
  if [[ $ENV_PIP_PROJECT_INSTALL = true && -f "$REQUIREMENTS_TXT" ]]; then

    if [[ $ENV_INSTALL_PYTHON3 = false ]]; then
      echo "Automatic packages installation (PIP_PROJECT_INSTALL) require also Python installed (INSTALL_PYTHON3). Operation failed.";
    else
      # shellcheck disable=SC2164
      cd "$dir"
      pip install -r requirements.txt
      echo "PIP DEPENDENCIES Autoinstall"
    fi
  fi

done;

sleep infinity;