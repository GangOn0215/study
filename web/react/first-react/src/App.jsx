import { useState } from 'react'
import './App.css'
import A01Greeting from './components/a01_Greeting'
import A02Props from './components/a02_Props'
import A03Profile from './components/a03_Profile'
import A04ProductCard from './components/a04_productCard'
import A05UserCard from './components/a05_userCard'
import A06FruitList from './components/a06_fruitList'
import A07Counter from './components/a07_counter'
import A08Toggle from './components/a08_toggle'
import A09LikeButton from './components/a09_likeButton'
import A10InputBox from './components/a10_inputBox'
import A11TodoList from './components/a11_todoList'

function App() {
  const [count, setCount] = useState(0)
  const fruits = [        // ← 배열 전체
    { id: 1, name: '사과', emoji: '🍎' },
    { id: 2, name: '바나나', emoji: '🍌' },
    { id: 3, name: '포도', emoji: '🍇' },
  ]
  return (
    <>
      {/* <A01Greeting /> */}
      {/* <A02Props name="Jun" /> */}
      {/* <A03Profile name="Jun" favFood="Susi" hobby="11" /> */}
      {/* 
      <A04ProductCard 
        name="노트북" 
        price={1500000} 
        image="https://images.unsplash.com/photo-1603302576837-37561b2e2302?q=80&w=2068&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" 
        isStock={true}
      /> 
      */}
      {/*  */}
      {/* <A05UserCard name={'Jack'} age={20} isPremium={true}/> */}
      {/* <A05UserCard name={'Alice'} age={17} isPremium={true}/> */}
      {/* <A06FruitList fruits={fruits} /> */}
      {/* <A07Counter /> */}
      {/* <A08Toggle /> */}
      {/* <A09LikeButton /> */}
      {/* <A10InputBox /> */}
      <A11TodoList />
    </>
  );
}

export default App

