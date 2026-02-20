import A12Products from "./a12_products";
import "./a12_cart.css";
import { useEffect, useState } from "react";
import A12Cart from "./a12_cart";
/**
 * [ 상품 목록 영역 ]
 *
 *  - 상품은 총 4개이며, 각 상품은 이름과 가격 정보를 가지고 있다
 *  - 상품마다 "담기" 버튼이 있다
 *  - "담기" 버튼을 누르면 장바구니에 해당 상품이 추가된다
 *  - 이미 장바구니에 있는 상품을 다시 "담기" 하면, 새로 추가되지 않고 수량이 1 증가한다
 *
 * [ 장바구니 영역 ]
 *
 * - 담긴 상품의 이름, 단가, 수량, 소계(단가 × 수량)를 표시한다
 * - 각 상품마다 수량을 늘릴 수 있는 + 버튼과 줄일 수 있는 - 버튼이 있다
 * - 수량이 1인 상태에서 - 버튼을 누르면 해당 상품이 장바구니에서 삭제된다
 * - 각 상품마다 "삭제" 버튼이 있으며, 누르면 수량에 관계없이 즉시 삭제된다
 * - 장바구니가 비어있으면 "장바구니가 비어있습니다" 문구를 표시한다
 *
 * [ 총 금액 영역 ]
 *
 * - 장바구니에 담긴 모든 상품의 소계를 합산한 총 금액을 표시한다
 * - 상품 추가, 삭제, 수량 변경 시 총 금액이 즉시 반영된다
 *
 */

function A12CartMain() {
  const [myCart, setMyCart] = useState([]);
  const [totalPrice, setTotalPrice] = useState(0);

  const products = [
    { id: 1, name: "노트북", price: 1200000 },
    { id: 2, name: "마우스", price: 35000 },
    { id: 3, name: "키보드", price: 89000 },
    { id: 4, name: "모니터", price: 450000 },
  ];

  // 장바구니 추가 함수
  function onAddCart(productId) {
    // myCart에서 해당 productId로 조회하여 데이터를 가져온다.
    const myCartProduct = myCart.filter((cart) => {
      return cart.productId == productId;
    });

    // 만약 myCartProduct 에 데이터가 있으면, 업데이트 아니면 추가를 해야하지 않나?
    if (myCartProduct.length > 0) {
      const newMyCart = myCart.map((cart) => {
        return cart.productId == productId
          ? { ...cart, count: cart.count + 1 }
          : cart;
      });

      setMyCart(newMyCart);

      return;
    } else {
      if (!myCartProduct.count) {
        myCartProduct.count = 0;
      }

      setMyCart([
        ...myCart,
        { productId: productId, count: myCartProduct.count + 1 },
      ]);
    }
  }

  function onSubCart(productId) {
    const myCartProduct = myCart.filter((cart) => {
      return cart.productId == productId;
    });

    // 1차적으로 빼는 버튼을 누르게 되면, count - 1 을 해줌.
    if (myCartProduct.length > 0) {
      const newMyCart = myCart.map((cart) => {
        return cart.productId == productId
          ? { ...cart, count: cart.count - 1 }
          : cart;
      });

      setMyCart(
        newMyCart.filter((cart) => {
          return cart.count != 0;
        }),
      );

      return;
    }
  }

  function onDelCart(productId) {
    setMyCart(
      myCart.filter((cart) => {
        return cart.productId != productId;
      }),
    );
  }

  function animateCount(from, to, setValue) {
    const duration = 100; // 애니메이션 시간 (ms)
    const startTime = performance.now();

    function update(currentTime) {
      const elapsed = currentTime - startTime;
      const progress = Math.min(elapsed / duration, 1); // 0 ~ 1

      const current = Math.floor(from + (to - from) * progress);
      setValue(current);

      if (progress < 1) {
        requestAnimationFrame(update);
      }
    }

    requestAnimationFrame(update);
  }

  useEffect(() => {
    const newTotal = myCart.reduce((acc, cur) => {
      const product = products.find((p) => p.id == cur.productId);
      return acc + product.price * cur.count;
    }, 0);

    animateCount(totalPrice, newTotal, setTotalPrice); // ← 이제 제대로 동작
  }, [myCart]);

  return (
    <div className="cart-page">
      <div className="cart-left-panel">
        <A12Products onAddCart={onAddCart} products={products} />
        <A12Cart
          myCartList={myCart}
          onAddCart={onAddCart}
          onSubCart={onSubCart}
          onDelCart={onDelCart}
          products={products}
          totalPrice={totalPrice}
        />
      </div>
      <div className="cart-right-panel">
        <div className="payment-box">
          <h3 className="payment-title">💳 결제 정보</h3>
          <div className="payment-row">
            <span className="payment-total-text">총 금액</span>
            <span className="payment-amount">
              {totalPrice.toLocaleString()} ₩
            </span>
          </div>
          <button className="payment-btn">결제하기</button>
        </div>
      </div>
    </div>
  );
}

export default A12CartMain;
