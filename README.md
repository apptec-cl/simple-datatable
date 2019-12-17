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
gem 'simple-datatable'

```

It also depends on:


```
gem 'will_paginate', '~> 3.1.0'

```

Automatically we are created a folder with the  structure of the tables ```app/datatables```.

## Usage


Generate model with structure datatables, open your terminal and write:

```
$ datatable g model_name
```


Example Controller:

```
# Query with data
@clients = Client.all

# Format table
data = %w[clients.id clients.name clients.lastname clients.address]
  respond_to do |format|
  format.html
  format.json { render json: ClientsDatatable.new(view_context, @clients, data) }
end

```

View:

```
<table id="datatable" class="table datatable_table table-hover" role="grid" data-source="<%= clients_path(format: :json) %>" cellspacing="0">
  <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Last Name</th>
      <th>Address</th>
    </tr>
  </thead>

  <tbody>
  <!-- leave blank -->
  </tbody>
</table>
```

Folder datatable:

```
class ClientsDatatable < ApplicationDatatable
private
  def data
    dimension.map do |dimension|
    [
      # Add your attributes
      dimension.id,
      dimension.name,
      dimension.lastname,
      dimension.address,
    ]
    end
  end
end
```

### Quickstart


## Contributing

1. Fork it ( https://github.com/apptec-cl/datatable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
