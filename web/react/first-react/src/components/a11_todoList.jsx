import { useState } from "react";
import { MdOutlineCheckBox } from "react-icons/md";
import { MdOutlineCheckBoxOutlineBlank } from "react-icons/md";
import { HiOutlineTrash } from "react-icons/hi";
import { FiEdit3 } from "react-icons/fi";
import { PiCheckFatBold } from "react-icons/pi";
import "./a11_todoList.css";

/**
 * TODO :
 *      ☑ delete 함수 완성
 *      1. ES6 >> Array.prototype.map & Array.prototype.filter, Spread 정리
 *      2. React onClick 에서  onClick={() => {onUpdateTodos(id)} 으로 넣는것과 onClick={onUpdateTodos(id)} 로 넣는 것 차이 정리
 *      ☑ [ Library ] React Icons 정리
 *
 * [ 260219 ]
 *    > toggle Edit & edit 모드
 */

function A11TodoList() {
  const [lastIndex, setLastIndex] = useState(1);
  const [todoTitle, setTodoTitle] = useState("");
  const [todoEditTitle, setTodoEditTitle] = useState("");
  const [todos, setTodos] = useState([]);
  const [isEditing, setIsEditing] = useState(false);

  /**
   * CRUD
   */

  // create
  function onAddTodos() {
    if (!todoTitle.trim()) return;

    setTodos([
      ...todos,
      { id: lastIndex, title: todoTitle, isComplete: false, isEditing: false },
    ]);

    setLastIndex(lastIndex + 1);

    setTodoTitle("");
  }

  // editmode toggle
  function onToggleEdit(id) {
    if (isEditing) {
      alert("이미 수정 중 입니다.");
      return;
    }

    const newTodos = todos.map((todo) => {
      if (todo.id === id && !todo.isComplete) {
        // 만약 todo id 가 동일하며, 완료 상태가 아니라면.
        setTodoEditTitle(todo.title);
        setIsEditing(true);
        return { ...todo, isEditing: !todo.isEditing };
      } else {
        return todo;
      }
    });

    setTodos(newTodos);
  }

  // update toggle
  function onUpdateTodos(id) {
    if (!todoEditTitle.trim()) return; // 만약 데이터가 없다면 return

    // id로 검색하고, 현재 의 input - title 로 변경한다는 것이겠지?
    const newTodos = todos.map((todo) => {
      return todo.id == id
        ? { ...todo, title: todoEditTitle, isEditing: false }
        : todo; // todo.id ( 순회하며 id ) 와 업데이트 시킬 id가 같다면.
    });

    setIsEditing(false);
    setTodos(newTodos);
    setTodoEditTitle("");
  }

  // complete toggle
  function onToggleTodos(id) {
    const newTodos = todos.map((todo) => {
      return todo.id === id ? { ...todo, isComplete: !todo.isComplete } : todo;
    });

    setTodos(newTodos);
  }

  // delete
  function onDelTodos(id) {
    const newTodos = todos.filter((todo) => {
      return todo.id !== id;
    });

    if (confirm("정말 삭제 하시겠습니까?")) {
      setTodos(newTodos);
    }
  }

  // Read
  return (
    <div className="todo-container">
      <p className="todo-input-row">
        <input
          className="todo-input"
          type="text"
          value={todoTitle}
          onChange={(e) => setTodoTitle(e.target.value)}
        />
        <button className="todo-add-btn" onClick={onAddTodos}>
          ADD
        </button>
      </p>
      <div className="todo-list">
        {todos.map((todo) => (
          <div
            key={todo.id}
            className={`todo-item
                            ${todo.isComplete ? "completed" : ""}`}
          >
            {todo.isEditing ? (
              <input
                className="todo-edit-input"
                type="text"
                value={todoEditTitle}
                onChange={(e) => setTodoEditTitle(e.target.value)}
              />
            ) : (
              <span>{todo.title}</span>
            )}

            <div className="todo-button-wrap">
              <button
                className="default-button todo-check-btn"
                onClick={() => onToggleTodos(todo.id)}
              >
                {!todo.isEditing &&
                  (todo.isComplete ? (
                    <MdOutlineCheckBox />
                  ) : (
                    <MdOutlineCheckBoxOutlineBlank />
                  ))}
              </button>
              <button
                className="default-button todo-edit-btn"
                onClick={() =>
                  todo.isEditing
                    ? onUpdateTodos(todo.id)
                    : onToggleEdit(todo.id)
                }
              >
                {!todo.isComplete &&
                  (todo.isEditing ? <PiCheckFatBold /> : <FiEdit3 />)}
              </button>
              <button
                className="default-button todo-trash-btn"
                onClick={() => onDelTodos(todo.id)}
              >
                <HiOutlineTrash />
              </button>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

export default A11TodoList;
