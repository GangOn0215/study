import A12Products from "./a12_products";
import "./a12_cart.css";
import { useState } from "react";
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

  // 장바구니 추가 함수
  function onAddCart(productId) {
    // myCart에서 해당 productId로 조회하여 데이터를 가져온다.
    const myCartProduct = myCart.filter((cart) => {
      return cart.productId == productId;
    });

    console.log(myCartProduct);

    // 만약 myCartProduct 에 데이터가 있으면, 업데이트 아니면 추가를 해야하지 않나?
    if (myCartProduct.length > 0) {
      const newMyCart = myCart.map((cart) => {
        return cart.productId == productId
          ? { ...cart, count: cart.count + 1 }
          : cart;
      });

      setMyCart(newMyCart);

      return;
    }

    if (!myCartProduct.count) {
      myCartProduct.count = 0;
    }

    setMyCart([
      ...myCart,
      { productId: productId, count: myCartProduct.count + 1 },
    ]);
  }

  return (
    <>
      <A12Products onAddCart={onAddCart} />
    </>
  );
}

export default A12CartMain;
