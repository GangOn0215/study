function A12Products({ onAddCart, products }) {
  return (
    <div className="cart-container">
      {products.map((product) => {
        return (
          <div className="product-container" key={product.id}>
            <div>
              {product.name} <span>{product.price.toLocaleString()} ₩</span>
            </div>
            <div>
              <button onClick={() => onAddCart(product.id)}>담기</button>
            </div>
          </div>
        );
      })}
    </div>
  );
}

export default A12Products;
