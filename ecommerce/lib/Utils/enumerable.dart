enum CartWishlist { wishlist, cart }

enum Orders { pending, approve, reject }

getCartWishlistIndex(dynamic value) {
  if (CartWishlist.wishlist == value) {
    return 1;
  } else if (CartWishlist.cart == value) {
    return 2;
  }
}

getOrdersIndex(dynamic value) {
  if (Orders.pending == value) {
    return 1;
  } else if (Orders.approve == value) {
    return 2;
  } else if (Orders.reject == value) {
    return 3;
  }
}
