import {
    Routes,
    Route,
    Link,
    useNavigate
} from "react-router-dom";
import AboutUs from "../AboutUs";
import Marketplace from "../Marketplace";
import UserPage from "../UserPage/UserPage";
import { Segment } from "semantic-ui-react";
import { useState } from "react";
import Messages from "../Messages";
import { NavbarMenu, TruckingSegment } from "./NavbarStyles";

function Navbar({ onLogout, user, setUser, marketplace, setIssueRequest, issueRequest }) {
    const [activeItem, setActiveItem] = useState({ activeItem: 'userpage' })
    let navigate = useNavigate();

    function handleLogout() {
        fetch("/logout", {
            method: "DELETE",
        }).then(() => {
            navigate("/");
            onLogout();
        });
    }

    function handleItemClick(e, { name }) {
        setActiveItem({ activeItem: name })
    }

    return (
        <div>
            <NavbarMenu pointing secondary className="trucking-navbar">
                <NavbarMenu.Item as={Link} className="navigation" to="/userpage"
                    name="User Page"
                    active={activeItem === 'userpage'}
                    onClick={handleItemClick}
                />
                <NavbarMenu.Item as={Link} name="Marketplace" className="navigation" to="/marketplace"
                    active={activeItem === 'marketplace'}
                    onClick={handleItemClick}
                />
                <NavbarMenu.Item as={Link} name="About Us" className="navigation" to="/about"
                    active={activeItem === 'about'}
                    onClick={handleItemClick}
                />
                <NavbarMenu.Menu position='right'>
                    <NavbarMenu.Item as={Link} name="Messages" className="navigation" to="/mymessages"
                        active={activeItem === 'mymessages'}
                        onClick={handleItemClick}>
                        {user.messages.length !== 0 ? <i aria-hidden="true" className="red envelope square icon" ></i> : null}
                        Messages
                    </NavbarMenu.Item>
                    <NavbarMenu.Item className="navigation" onClick={handleLogout} name='Logout' />
                </NavbarMenu.Menu>
            </NavbarMenu>
            <TruckingSegment>
                <Routes>
                    <Route path="/mymessages" element={<Messages />} />
                    <Route path="/about" element={<AboutUs />} />
                    <Route path="/marketplace" element={<Marketplace marketplace={marketplace} user={user} issueRequest={issueRequest} setIssueRequest={setIssueRequest} />} />
                    <Route path="/userpage" element={<UserPage user={user} setUser={setUser} marketplace={marketplace} issueRequest={issueRequest} setIssueRequest={setIssueRequest} />} />
                    <Route path="/" element={<UserPage user={user} setUser={setUser} marketplace={marketplace} issueRequest={issueRequest} setIssueRequest={setIssueRequest} />} />
                </Routes>
            </TruckingSegment>
        </div >
    );
}

export default Navbar;