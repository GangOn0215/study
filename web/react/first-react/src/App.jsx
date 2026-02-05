import { useState } from 'react'
import './App.css'

function Greeting() {
  return <h1>Hello!</h1>;
}

// 프로필 컴포넌트 ( Props 를 추가해보자)
function Profile({name, hobby, favFood}) {

  return (
    <div style={{
      padding: '20px',
      border: '2px solid #4299e1',
      borderRadius: '8px',
      margin: '20px'
    }}>
      <h2>{name}</h2>
      <p>취미: {hobby}</p>
      <p>좋아하는 음식: {favFood}</p> 
    </div>
  )
}

// 컴포넌트 Props
function Welcome(props) {
  return <h1>Welcome, {props.name}!</h1>;
}

// 기본값
function Button({ text = "Click me", color="blue"}) {
  return (
    <button style={{ backgroundColor: color, color: 'white', padding: '10px', border: 'none', borderRadius: '5px' }}>
      {text}
    </button>
  )
}

// Product Card
function ProductCard({ name, price, image, isStock }) {
  return (
    <div style={{
      border: '1px solid #ddd',
      borderRadius: '8px',
      padding: '15px',
      margin: '10px',
      width: '200px',
      boxShadow: '0 2px 5px rgba(0,0,0,0.1)'
    }}>
      <img src={image} alt={name} style={{ width: '100%', borderRadius: '4px'}} />
      <h3>{name}</h3>
      <p style={{ fontSize: '20px', fontWeight: 'bold', color: '#e53e3e'}}>{price.toLocaleString()}</p>
      <p style={{ color: isStock ? 'green' : 'red'}}> {isStock ? '재고 있음' : '품절'} </p>
    </div>
  )
}

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      {/* <div>{count}</div> */}
      {/* <button onClick={() => setCount(count+1)}> Increment </button> */}

      {/* <Greeting /> */}
      {/* <Greeting /> */}
      {/* <Greeting /> */}

      {/* <Profile name="Jun" favFood="Susi" hobby="11" /> */}
      {/* <Profile name="Alice" hobby="Reading" favFood="Pasta" /> */}
      {/* <Profile name="Bob" hobby="Hiking" favFood="Steak" /> */}

      {/* <Welcome name="Jun" /> */}
      {/* <Welcome name="Alice" /> */}
      {/* <Welcome name="Bob" /> */}

      {/* <Button text="Submit" color="green" /> */}
      {/* <Button text="Cancel" color="red" /> */}
      {/* <Button /> */}

      <ProductCard 
        name="노트북" 
        price={1500000} 
        image="https://unsplash.com/ko/%EC%82%AC%EC%A7%84/a-macbook-with-lines-of-code-on-its-screen-on-a-busy-desk-m_HRfLhgABo" 
        isStock={true}
      />
    </>
  );
}

export default App

