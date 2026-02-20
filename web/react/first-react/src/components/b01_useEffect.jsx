import { useEffect, useState } from "react";
import "./b01_useEffect.css";

function B01UseEffect() {
  const [data, setData] = useState([]);
  const [detailData, setDetailData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchInput, setSearchInput] = useState(""); // 이름을 검색 하도록 하자
  const [selectedId, setSelectedId] = useState(null);
  const [userPosts, setUserPosts] = useState([]);
  const [openPostId, setOpenPostId] = useState(null);

  useEffect(() => {
    async function getUsers() {
      try {
        const res = await fetch("https://jsonplaceholder.typicode.com/users");
        const data = await res.json();

        setData(data);
        setLoading(false);
      } catch (e) {
        setError(e);
      }
    }

    getUsers();
  }, []);

  useEffect(() => {
    async function getUser() {
      if (!selectedId) return;
      try {
        const res = await fetch(
          `https://jsonplaceholder.typicode.com/users/${selectedId}`,
        );

        const data = await res.json();

        setDetailData(data);
      } catch (e) {
        setError(e);
      }
    }

    getUser();
  }, [selectedId]);

  useEffect(() => {
    async function getUserPosts() {
      const res = await fetch(
        `https://jsonplaceholder.typicode.com/posts?userId=${selectedId}`,
      );
      const data = await res.json();

      setUserPosts(data);
    }

    getUserPosts();
  }, [selectedId]);

  return (
    <div className="ue-layout">
      {/* 왼쪽 패널 - 리스트 */}
      <div className="ue-container">
        {loading ? (
          <p className={`ue-status ue-status--loading`}>Loading...</p>
        ) : null}

        <div className="ue-search-wrap">
          <input
            className="ue-search"
            type="text"
            placeholder="이름으로 검색..."
            value={searchInput}
            onChange={(e) => {
              setSearchInput(e.target.value);
            }}
          />
        </div>

        <div className="ue-list">
          {loading
            ? null
            : data
                .filter((item) =>
                  item.name.toLowerCase().includes(searchInput.toLowerCase()),
                )
                .map((item) => (
                  <div
                    className={`ue-item ${selectedId === item.id ? "ue-item--active" : ""}`}
                    key={item.id}
                    onClick={() => setSelectedId(item.id)}
                  >
                    <span className="ue-name">{item.name}</span>
                    <span className="ue-email">{item.email}</span>
                    <span className="ue-phone">{item.phone}</span>
                  </div>
                ))}
        </div>
        {error && <p className="ue-error">ERROR: {error.message}</p>}
      </div>

      {/* 오른쪽 패널 - 상세정보 */}
      <div className="ue-detail">
        {detailData ? (
          <>
            <div>
              <p className="ue-detail-title">회원 상세 정보</p>
              <div className="ue-detail-name">{detailData.name}</div>
              <div className="ue-detail-row">
                <span className="ue-detail-label">이메일</span>
                <span>{detailData.email}</span>
              </div>
              <div className="ue-detail-row">
                <span className="ue-detail-label">전화번호</span>
                <span>{detailData.phone}</span>
              </div>
              <div className="ue-detail-row">
                <span className="ue-detail-label">회사</span>
                <span>{detailData.company?.name}</span>
              </div>
              <div className="ue-detail-row">
                <span className="ue-detail-label">주소</span>
                <span>{detailData.address?.city}</span>
              </div>
            </div>

            <div className="ue-posts">
              <p className="ue-posts-title">Posts</p>
              {userPosts.map((post) => (
                <div
                  className="ue-post-item"
                  key={post.id}
                  onClick={() => {
                    let postId = post.id;
                    if (postId == selectedId) {
                      postId = null;
                    }

                    setOpenPostId(postId);
                  }}
                >
                  <p className="ue-post-header">{post.title}</p>
                  <p
                    className={`ue-post-body ${openPostId == post.id ? "show" : ""}`}
                  >
                    {post.body}
                  </p>
                </div>
              ))}
            </div>
          </>
        ) : (
          <p className="ue-detail-empty">👈 회원을 선택하세요</p>
        )}
      </div>
    </div>
  );
}

export default B01UseEffect;
