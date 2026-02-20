import { FaRegPlusSquare } from "react-icons/fa";
import { FaRegMinusSquare } from "react-icons/fa";
import { AiOutlineDelete } from "react-icons/ai";
import { PiShoppingCartBold } from "react-icons/pi";

function A12Cart({
  myCartList,
  products,
  onAddCart,
  onSubCart,
  onDelCart,
  totalPrice,
}) {
  // 이제 여기서 내가 장바구니 담은거, 목록 뿌려줘야함
  // const [totalPrice, setTotalPrice] = useState(0);

  return (
    <div className="cart-section">
      {myCartList.map((cart) => {
        const productInfo = products.filter((product) => {
          return product.id == cart.productId;
        });

        const product = products.find(
          (product) => product.id == cart.productId,
        );

        const price = product.price * cart.count;

        return (
          <div className="cart-item" key={cart.productId}>
            <span className="cart-item-name">{productInfo[0].name}</span>
            <span className="cart-item-qty">{cart.count}개</span>
            <span className="cart-item-price">{price.toLocaleString()} ₩</span>
            <div>
              <button onClick={() => onAddCart(cart.productId)}>
                <FaRegPlusSquare />
              </button>
              <button onClick={() => onSubCart(cart.productId)}>
                <FaRegMinusSquare />
              </button>
              <button onClick={() => onDelCart(cart.productId)}>
                <AiOutlineDelete />
              </button>
            </div>
          </div>
        );
      })}
      {myCartList.length > 0 ? (
        <div className="cart-total-row">
          <span>합계</span>
          <span className="cart-total-price">
            {totalPrice.toLocaleString()} ₩
          </span>
        </div>
      ) : (
        <div className="cart-empty">
          <PiShoppingCartBold /> 장바구니가 비어있습니다.
        </div>
      )}
    </div>
  );
}

export default A12Cart;
