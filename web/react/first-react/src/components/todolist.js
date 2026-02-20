const a = [1, 2, 3]; // ?
const b = [...a]; // ?
const c = [...a, 4]; // ?

console.log(b);
console.log(c);

let todos = [
  { id: 1, title: "공부", isComplete: false },
  { id: 2, title: "운동", isComplete: true },
]; //?

todos = [...todos, { id: 3, title: "산책", isComplete: false }]; //?

let updated = todos.map((todo) =>
  todo.id == 1 ? { ...todo, isComplete: true } : todo,
); // ?

console.log(updated); // ?

let deleted = todos.filter((todo) => {
  return todo.id != 1;
});

console.log(deleted);

const aa = [1, 2, 3];

aa.filter((item) => {
  return item > 1;
}); // ?

const aMap = [1, 2, 3];

const updateAmap = aMap.map((item) => {
  return item;
}); // ?

console.log(updateAmap);
