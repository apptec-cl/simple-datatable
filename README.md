# Simple Datatable
[![GitHub version](https://badge.fury.io/gh/apptec-cl%2Fdatatable.svg)](https://badge.fury.io/gh/apptec-cl%2Fdatatable)

## Description

Datatables development to Apptec, we add advanced interaction controls to your HTML tables the free & easy way in ruby on rails, this gem gives you a good starting with datatables.

```
      ___           ___         ___                     ___           ___
     /  /\         /  /\       /  /\        ___        /  /\         /  /\
    /  /::\       /  /::\     /  /::\      /  /\      /  /:/_       /  /:/
   /  /:/\:\     /  /:/\:\   /  /:/\:\    /  /:/     /  /:/ /\     /  /:/
  /  /:/~/::\   /  /:/~/:/  /  /:/~/:/   /  /:/     /  /:/ /:/_   /  /:/  ___
 /__/:/ /:/\:\ /__/:/ /:/  /__/:/ /:/   /  /::\    /__/:/ /:/ /\ /__/:/  /  /\
 \  \:\/:/__\/ \  \:\/:/   \  \:\/:/   /__/:/\:\   \  \:\/:/ /:/ \  \:\ /  /:/
  \  \::/       \  \::/     \  \::/    \__\/  \:\   \  \::/ /:/   \  \:\  /:/
   \  \:\        \  \:\      \  \:\         \  \:\   \  \:\/:/     \  \:\/:/
    \  \:\        \  \:\      \  \:\         \__\/    \  \::/       \  \::/
     \__\/         \__\/       \__\/                   \__\/         \__\/

```


## Requirements

 - Ruby 
 - Rails
 - datatables
 - Human

## Installation

It is necessary to install lib datatable from:

[https://datatables.net/download/index](https://datatables.net/download/index)

in your file ```application.js```


```

//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.yadcf
//= require dataTables/dataTables.bootstrap4
//= require dataTables/dataTables.responsive
//= require dataTables/responsive.bootstrap4

```

add gem

```
gem 'datatable', :git => 'git@github.com:apptec-cl/datatable.git'

```

Generate model with structure datatables, open your terminal and write:

```
$ datatable g model_name
```

Automatically we are created a folder with the  structure of the tables ```app/datatables```.

## Usage

### Quickstart


## Contributing

1. Fork it ( https://github.com/apptec-cl/datatable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
