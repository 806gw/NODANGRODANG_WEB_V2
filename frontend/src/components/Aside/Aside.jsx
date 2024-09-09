import { useState } from "react";
import styles from "./Aside.module.css";
import { MdOutlineMenu } from "react-icons/md";
import { IoMdClose } from "react-icons/io";
import Logo from "../../assets/images/GyungRoDang.png";

const Aside = () => {
  const [openAside, setOpenAside] = useState(false);

  const handleOpenAside = () => {
    setOpenAside((prev) => !prev);
  };

  return (
    <>
      <div>
        <MdOutlineMenu className={styles.menu} onClick={handleOpenAside} />
      </div>
      <aside className={`${styles.aside} ${openAside ? styles.open : ""}`}>
        <div className={styles.header}>
          <img src={Logo} alt="경로당 로고" />
          <IoMdClose className={styles.closeMenu} onClick={handleOpenAside} />
        </div>
        <div></div>
      </aside>
    </>
  );
};

export default Aside;
