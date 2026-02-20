/**
 * useState: 상태 관리
 * useEffect: 컴포넌트 처음 나타날때, 어떤 값이 바뀔때 특정 작업 수행
 * useRef: 특정 DOM 접근, 값 저장(렌더링X)                                                       
 */
import { useState, useEffect, useRef } from 'react'
import './App.css'

function App() {
  const [todos, setTodos] = useState([]);
  const [input, setInput] = useState('');
  const inputRef = useRef(null);

  useEffect(() => {
    const saveTods = JSON.parse(localStorage.getItem('todos'));
    if (saveTods) {
      setTodos(saveTods);
    }
  }, [])

  useEffect(() => {
    localStorage.setItem('todos', JSON.stringify(todos));
  }, [todos])

  const addTodo = () => {
    if(!input.trim()) return;

    setTodos([
      ...todos,
      {
        id: Date.now(),
        text: input,
        completed: false
      }
    ])

    setInput(''); 
    inputRef.current.focus();
  }

  const toggleTodo = (id) => {
    setTodos(
      todos.map(todo => 
        todo.id === id ? { ...todo, completed: !todo.completed } : todo)
    )
  }

  const deleteTodo = (id) => {
    setTodos(todos.filter(todo => todo.id !== id));
  }

  return (
    <>
      <h1>My Todo List</h1>
      
      <div className="input-area">
        <input 
          ref={inputRef}
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === 'Enter') {
              addTodo();
            }
          }}
        />

        <button onClick={addTodo}>Add</button>
      </div>

      <ul className='todo-list'>
        {
          todos.map(todo => (
            <li key={todo.id} className={todo.completed ? 'completed' : ''}>
              <span onClick={() => toggleTodo(todo.id)}>{todo.text}</span>
              <button onClick={() => deleteTodo(todo.id)}>Delete</button>
            </li>
          ))
        }
      </ul>
    </>
  )
}

export default App
