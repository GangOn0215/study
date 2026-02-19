import { useState } from "react";
import { MdOutlineCheckBox } from "react-icons/md";
import { MdOutlineCheckBoxOutlineBlank } from "react-icons/md";
import { HiOutlineTrash } from "react-icons/hi";
import './a11_todoList.css';

/**
 * TODO : 
 *      0. ☑ delete 함수 완성
 *      1. ES6 >> Array.prototype.map & Array.prototype.filter, Spread 정리
 *      2. React onClick 에서  onClick={() => {onUpdateTodos(id)} 으로 넣는것과 onClick={onUpdateTodos(id)} 로 넣는 것 차이 정리
 *      3. [ Library ] React Icons 정리
 */

function A11TodoList() {
    const [lastIndex, setLastIndex] = useState(1);
    const [todoTitle, setTodoTitle] = useState('');

    const [todos, setTodos] = useState([]);

    /**
     * CRUD
     */

    // create
    function onAddTodos() {
        setTodos([...todos, { id: lastIndex, title: todoTitle, isComplete: false }]);
        setLastIndex(lastIndex + 1);

        setTodoTitle('');
    }

    // delete
    function onDelTodos(id) {
        const newTodos = todos.filter((todo) => {
            return todo.id !== id;
        });

        setTodos(newTodos);
    }

    // update
    function onUpdateTodos(id) {
        const newTodos = todos.map((todo) => {
            return todo.id === id ? { ...todo, isComplete: !todo.isComplete } : todo
        })

        setTodos(newTodos);
    }

    // Read
    return (
        <div className="todo-container">
            <p className="todo-input-row">
                <input className="todo-input" type="text" value={todoTitle} onChange={(e) => setTodoTitle(e.target.value)} /> 
                <button className="todo-add-btn" onClick={onAddTodos}>ADD</button>
            </p>
            <div className="todo-list">
                {todos.map((todo) => (
                    <p key={todo.id} className={`todo-item ${todo.isComplete ? 'completed' : ''}`}>
                        <span>{todo.title}</span>
                        <div className="todo-button-wrap">
                            <button className="default-button todo-check-btn" onClick={() => onUpdateTodos(todo.id)}> { todo.isComplete ? <MdOutlineCheckBox /> : <MdOutlineCheckBoxOutlineBlank />} </button>
                            <button className="default-button todo-trash-btn" onClick={() => onDelTodos(todo.id)}><HiOutlineTrash /></button>
                        </div>
                    </p>
                ))}
            </div>
        </div>
    )
}

export default A11TodoList;
