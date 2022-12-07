import { useEffect } from "react";
import { useState } from "react";

// ajax를 사용하여 localhost:8080에 접근하여 값을 가져옴
const DBBox = () => {
  // 가져온 값을 저장할 state
  const [data, setData] = useState();
  const [search, setSearch] = useState("사과");

  useEffect(() => {
    async function fetchData() {
      // 실행하자마자 값을 가져옴
      const response = await fetch(
        `/04_DBSelect/selectProduct.jsp?name${search}`
      );
      const data = await response.json();
      console.log(data);
      setData(data);
    }
    fetchData();
  });

  return (
    <div>
      <h1>DBBox 컴포넌트가 실행</h1>
      {data && data.name}
      {data && data.count}
    </div>
  );
};

export default DBBox;
