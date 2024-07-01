require_relative 'easy-box-packer'
easy = EasyBoxPacker.pack(
  container: { dimensions: [15, 20, 13], weight_limit: 50 },
  items: [
    { dimensions: [2, 3, 5], weight: 47, options: {id: '2221', label: 'green shoes' } },
    { dimensions: [2, 3, 5], weight: 47, options: {id: '2222', label: 'orange cap' } },
    { dimensions: [3, 3, 1], weight: 24, options: {id: '2223', label: 'blue jeans' } },
    { dimensions: [1, 1, 4], weight: 7, options: {id: '2224', label: 'black coat' } },
  ]
)

puts easy