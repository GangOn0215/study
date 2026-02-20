import { FaRegPlusSquare } from "react-icons/fa";
import { FaRegMinusSquare } from "react-icons/fa";

function A12Products({ onAddCart }) {
  const products = [
    { id: 1, name: "노트북", price: 1200000 },
    { id: 2, name: "마우스", price: 35000 },
    { id: 3, name: "키보드", price: 89000 },
    { id: 4, name: "모니터", price: 450000 },
  ];

  return (
    <div className="cart-container">
      {products.map((product) => {
        return (
          <div className="product-container" key={product.id}>
            <div>
              {product.name} <span>{product.price.toLocaleString()} ₩</span>
            </div>
            <div>
              <button onClick={() => onAddCart(product.id)}>
                <FaRegPlusSquare />
              </button>
              <button>
                <FaRegMinusSquare />
              </button>
            </div>
          </div>
        );
      })}
    </div>
  );
}

export default A12Products;
