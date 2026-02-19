function A03Profile({name, hobby, favFood}) {
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

export default A03Profile;