# EasyBoxPackerPlus

This is a clone of the [gem easy-box-packer](https://github.com/alChaCC/easy-box-packer) with added functionality to pass a hash with custom options for the items. I want to extend my gratitude to the original authors, [@mushishi78](https://github.com/mushishi78) of the [box_packer gem](https://github.com/mushishi78/box_packer/) and [@alChaCC](https://github.com/alChaCC) of the [easy-box-packer gem](https://github.com/alChaCC/easy-box-packer), for their efforts in the algorithm inspired by ["The Three-Dimensional Bin Packing Problem with Heterogeneous Bins"](https://www.researchgate.net/publication/273121476_A_genetic_algorithm_for_the_three-dimensional_bin_packing_problem_with_heterogeneous_bins) and ["A New Heuristic Algorithm for the 3D Bin Packing Problem."](https://www.researchgate.net/publication/226249396_A_New_Heuristic_Algorithm_for_the_3D_Bin_Packing_Problem).
This gem was created because the latter has not been updated in over six years.

## Installation

Add to gemfile:

``` ruby
gem 'easy-box-packer-plus', '~> 0.0.2'
```

## Usage

### Check all items can be packed in a container

``` ruby
require 'easy-box-packer'

cont = EasyBoxPacker.pack(
  container: { dimensions: [15, 20, 13], weight_limit: 50 },
  items: [
    { dimensions: [2, 3, 5], weight: 47, options: {id: '2221', label: 'green shoes' } },
    { dimensions: [2, 3, 5], weight: 47, options: {id: '2222', label: 'orange cap' } },
    { dimensions: [3, 3, 1], weight: 24, options: {id: '2223', label: 'blue jeans' } },
    { dimensions: [1, 1, 4], weight: 7, options: {id: '2224', label: 'black coat' } },
  ]
)

cont[:packings].length # 3
cont[:packings][0][:weight] # 47
cont[:packings][0][:placements].length # 1
cont[:packings][0][:placements][0][:dimensions] # [2, 3, 5]
cont[:packings][0][:placements][0][:position] # [0, 0, 0]
cont[:packings][1][:weight] # 47
cont[:packings][1][:placements].length # 1
cont[:packings][1][:placements][0][:dimensions] # [2, 3, 5]
cont[:packings][1][:placements][0][:position] # [0, 0, 0]
cont[:packings][2][:weight] # 31
cont[:packings][2][:placements].length # 2
cont[:packings][2][:placements][0][:dimensions] # [1, 3, 3]
cont[:packings][2][:placements][0][:position] # [0, 0, 0]
cont[:packings][2][:placements][1][:dimensions] # [4, 1, 1]
cont[:packings][2][:placements][1][:position] # [3, 0, 0]
```
Now you can access any key you have placed inside the options hash within the items hash:
```
{
  "packings": [{
    "placements": [{
      "dimensions": [2, 3, 5],
      "position": [0, 0, 0],
      "weight": 47.0,
      "id": "2222",
      "label": "orange cap"
    }],
    "weight": 47.0,
    "spaces": [{
      "dimensions": [18, 15, 13],
      "position": [2, 0, 0]
    }, {
      "dimensions": [2, 12, 13],
      "position": [0, 3, 0]
    }, {
      "dimensions": [2, 3, 8],
      "position": [0, 0, 5]
    }]
  }, {
    "placements": [{
      "dimensions": [2, 3, 5],
      "position": [0, 0, 0],
      "weight": 47.0,
      "id": "2221",
      "label": "green shoes"
    }],
    "weight": 47.0,
    "spaces": [{
      "dimensions": [18, 15, 13],
      "position": [2, 0, 0]
    }, {
      "dimensions": [2, 12, 13],
      "position": [0, 3, 0]
    }, {
      "dimensions": [2, 3, 8],
      "position": [0, 0, 5]
    }]
  }, {
    "placements": [{
      "dimensions": [1, 1, 4],
      "position": [0, 0, 0],
      "weight": 7.0,
      "id": "2224",
      "label": "black coat"
    }, {
      "dimensions": [1, 3, 3],
      "position": [0, 1, 0],
      "weight": 24.0,
      "id": "2223",
      "label": "blue jeans"
    }],
    "weight": 31.0,
    "spaces": [{
      "dimensions": [19, 15, 13],
      "position": [1, 0, 0]
    }, {
      "dimensions": [1, 1, 9],
      "position": [0, 0, 4]
    }, {
      "dimensions": [1, 11, 13],
      "position": [0, 4, 0]
    }, {
      "dimensions": [1, 3, 10],
      "position": [0, 1, 3]
    }, {
      "dimensions": [0, 3, 3],
      "position": [1, 1, 0]
    }]
  }],
  "errors": []
}
```

### Get a reasonable smallest container by given boxes

```
container = EasyBoxPacker.find_smallest_container(
    items: Array.new(1000) {{ dimensions: [1, 1, 1] }}
  )
container # [10, 10, 10]
```
