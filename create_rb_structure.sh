#!/bin/sh

show_menu() {
  echo "Choose Option:"
  echo "=============="
  echo "Use this directory       [1]"
  echo "Use different directory  [2]"
  echo "Quit                     [q]"
  parse_menu
}

parse_menu() {
  read -p ": " uin
  case $uin in
    1)  create_structure
        create_files ;;
    2)  ;;
    q)  exit 0 ;;
    *)  echo "Wrong input"
        parse_menu ;;
  esac
}

create_structure() {
  mkdir -p app/{controllers,helpers,models,views}
  mkdir -p config
  mkdir -p log
  mkdir -p public/{fonts,images,script,css}
  mkdir -p spec
}

create_files() {
  touch Gemfile
  touch config.ru
  touch app/controllers/application_controller.rb
  touch config/database.yml
  touch config/environment.rb
}

case $# in
  0)  show_menu ;;
esac
