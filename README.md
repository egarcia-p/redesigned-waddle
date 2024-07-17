# Redesigned::Waddle

This is a challenge in Ruby that calculates the smallest spread on a given "dat" file of weather days. Also it calculates the smallest goal difference in a list of teams also given in a "dat" file.

## Installation

### 1. Install Ruby

Install ruby accordign to your OS.

### 2. Bundle install

In the command line, navigate to the root of the project and run the following command:

```BASH
bundle install
```

## Usage

This project uses the thor [gem](https://rubygems.org/gems/thor).

### Show all available commands

The `help` command lists all the commands used for the project along with the corresponding descriptions:

```BASH
ruby lib/main.rb help
```

### Run the program

The `find_smallest_spread` command recieves an INPUT FILE and a SEPARATOR (optional), then outputs the smallest spread day in the input file.
By default the separator is `BLANK SPACE`

```BASH
ruby lib/main.rb find_smallest_spread <INPUT_FILE>
Example:
ruby lib/main.rb find_smallest_spread path/to/file.txt
```

You can use a different separator such as `,`

```BASH
ruby lib/main.rb find_smallest_spread <INPUT_FILE> <SEPARATOR>
Example:
ruby lib/main.rb find_smallest_spread path/to/file.txt ","
```

The `find_team_smallest_difference` command recieves an INPUT FILE and a SEPARATOR (optional), then outputs the team with the smallest goal difference in the input file.
By default the separator is `BLANK SPACE`

```BASH
ruby lib/main.rb find_team_smallest_difference <INPUT_FILE>
Example:
ruby lib/main.rb find_team_smallest_difference path/to/file.txt
```

You can use a different separator such as `,`

```BASH
ruby lib/main.rb find_team_smallest_difference <INPUT_FILE> <SEPARATOR>
Example:
ruby lib/main.rb find_team_smallest_difference path/to/file.txt ","
```

## Testing

This project uses the rspec [gem](https://rubygems.org/gems/rspec/versions/3.4.0?locale=en).

### Executing tests for all specs

In the command line, navigate to the root of the project and run the following command:

```BASH
rspec --format doc
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
