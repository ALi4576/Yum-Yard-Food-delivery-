const user = {
  'id': 1,
  'name': 'Ali Asad',
};

const categories = {
  'categories': [
    {
      'id': 1,
      'name': 'Burger',
      'image':
          'https://www.thecookierookie.com/wp-content/uploads/2023/04/featured-stovetop-burgers-recipe.jpg',
      'featured': true,
    },
    {
      'id': 2,
      'name': 'Pizza',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg',
      'featured': true,
    },
    {
      'id': 3,
      'name': 'Taco',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/chicken-tacos-index-659443ccdaac5.jpg?crop=0.888888888888889xw:1xh;center,top&resize=1200:*',
      'featured': true,
    },
    {
      'id': 4,
      'name': 'Coffee',
      'image':
          'https://www.tastingtable.com/img/gallery/20-different-types-of-coffee-explained/intro-1659544996.jpg',
      'featured': true,
    },
    {
      'id': 5,
      'name': 'Cappuccino',
      'image':
          'https://methodicalcoffee.com/cdn/shop/articles/cap.jpg?v=1684507364',
    },
    {
      'id': 6,
      'name': 'Breakfast',
      'image':
          'https://www.yummytummyaarthi.com/wp-content/uploads/2022/10/3-1-683x1024.png',
    },
    {
      'id': 7,
      'name': 'Dessert',
      'image':
          'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/LINK-TRAFFIC-18.jpg',
    },
    {
      'id': 8,
      'name': 'Salad',
      'image':
          'https://thewoodenskillet.com/wp-content/uploads/2020/07/grilled-chicken-salad-recipe-1-1.jpg',
    },
  ],
};

const discountProducts = [
  {
    'id': 1,
    'name': 'Paratha',
    'image':
        'https://www.yummytummyaarthi.com/wp-content/uploads/2022/10/3-1-683x1024.png',
    'price': '10.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'discount': {
      'type': 'amount',
      'value': 10 - (10 / 100 * 10),
      'title': '10% off',
    },
    'featured': true,
    'category': 'Breakfast',
  },
  {
    'id': 2,
    'name': 'Cornetto',
    'image':
        'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/LINK-TRAFFIC-18.jpg',
    'price': '5.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'discount': {
      'type': 'amount',
      'value': 5 - (5 / 100 * 2),
      'title': '2% off',
    },
    'featured': true,
    'category': 'Dessert',
  },
  {
    'id': 3,
    'name': 'Chicken Pizza',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg',
    'price': '15.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'discount': {
      'type': 'amount',
      'value': 5 - (5 / 100 * 2),
      'title': '2% off',
    },
    'rating': 4.5,
    'category': 'Pizza',
  },
];

const featuredProducts = [
  {
    'id': 1,
    'name': 'Paratha',
    'image':
        'https://www.yummytummyaarthi.com/wp-content/uploads/2022/10/3-1-683x1024.png',
    'price': '10.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'featured': true,
    'category': 'Breakfast',
    'rating': 4.8,
  },
  {
    'id': 2,
    'name': 'Cornetto',
    'image':
        'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/LINK-TRAFFIC-18.jpg',
    'price': '5.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'featured': true,
    'category': 'Dessert',
    'rating': 4.2,
  },
  {
    'id': 3,
    'name': 'Chicken Pizza',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg',
    'price': '15.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'rating': 4.5,
    'category': 'Pizza',
    'featured': true,
  },
];

const placedOrders = [
  {
    'id': 2,
    'name': 'Cornetto',
    'image':
        'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/LINK-TRAFFIC-18.jpg',
    'price': '5.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'quantity': 2,
    'category': 'Dessert',
    'eta': '20 min',
    'status': 'PickedUp',
  },
  {
    'id': 3,
    'name': 'Chicken Pizza',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg',
    'price': '15.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'category': 'Pizza',
    'quantity': 4,
    'eta': '0 min',
    'status': 'Delivered',
  },
];

const orderHistory = [
  {
    'order_id': 1,
    'date': '2022-10-10',
    'total': '20.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'items': [
      {
        'id': 2,
        'name': 'Cornetto',
        'image':
            'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/LINK-TRAFFIC-18.jpg',
        'price': '5.00',
        'quantity': 2,
        'category': 'Dessert',
        'status': 'Delivered',
      },
      {
        'id': 3,
        'name': 'Chicken Pizza',
        'image':
            'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg',
        'price': '15.00',
        'category': 'Pizza',
        'quantity': 4,
        'status': 'Cancelled',
      },
    ],
  },
  {
    'order_id': 1,
    'date': '2022-10-10',
    'total': '20.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'items': [
      {
        'id': 2,
        'name': 'Cornetto',
        'image':
            'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/LINK-TRAFFIC-18.jpg',
        'price': '5.00',
        'quantity': 2,
        'category': 'Dessert',
        'status': 'Delivered',
      },
      {
        'id': 3,
        'name': 'Chicken Pizza',
        'image':
            'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg',
        'price': '15.00',
        'category': 'Pizza',
        'quantity': 4,
        'status': 'Cancelled',
      },
    ],
  },
];

const cart = [
  {
    'total': '20.00',
    'currency': {
      'type': 'USD',
      'symbol': '\$',
    },
    'items': [
      {
        'id': 2,
        'name': 'Cornetto',
        'image':
            'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/LINK-TRAFFIC-18.jpg',
        'price': '5.00',
        'quantity': 2,
        'category': 'Dessert',
      },
      {
        'id': 3,
        'name': 'Chicken Pizza',
        'image':
            'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg',
        'price': '15.00',
        'category': 'Pizza',
        'quantity': 4,
      },
    ],
  },
];
