#!/bin/bash

## rsync exocortex pages to mkdocs

pages=(
"algorithms"
"bdd-behavior-driven-development"
"big-o-notation"
"ddd-domain-driven-design"
"di-dependency-injection"
"dsa-data-structures-algorithms"
"duck-type"
"functional-non-functional-requirements"
"golang"
"microservice-architecture"
"ood-composition"
"ood-designing-cost-effective-tests"
"ood-inheritance"
"ood-managing-dependencies"
"ood-object-oriented-design"
"ood-roles-modules"
"oop-object-oriented-programming"
"patterns-pattern-languages"
"personal-projects"
"soap-soa"
"software-architecture"
"solid"
"sops"
"synchronous-asynchronous-reactive-push-pull"
"tdd-test-driven-development"
'test-pyramid'
"tmux"
"tools"
"unit-testing"
"vim-nvim"
)

source_directory="$HOME/ruby/exo/pages"
destination_directory="./docs/pages"

for page in "${pages[@]}"; do
  source_path="$source_directory/$page.md"
  destination_path="$destination_directory/$page.md"

  printf "\n$page\n"
  rsync -auh --no-perms --no-times "$source_path" "$destination_path"
done
