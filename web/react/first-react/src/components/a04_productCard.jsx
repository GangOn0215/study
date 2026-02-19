function A04ProductCard({name, price, image, isStock}) {
  return (
    <div style={{
      padding: '20px',
      border: '2px solid #4299e1',
      borderRadius: '8px',
      margin: '20px'
    }}>
      <h2>{name}</h2>
        <img src={image} alt={name} style={{ width: '300px', height: '200px', objectFit: 'cover' }} />
      <p>가격: <span style={{ color: isStock ? 'green' : '#e53e3e'}}>{price.toLocaleString()}</span></p>
      <p>재고 상태: <span style={{ color: isStock ? 'green' : '#e53e3e'}}>{isStock ? '재고 있음' : '품절'}</span></p> 
    </div>
  )
}

export default A04ProductCard;