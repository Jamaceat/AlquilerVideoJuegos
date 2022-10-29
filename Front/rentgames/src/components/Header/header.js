import React from "react"
import {AppBar, Toolbar, IconButton, Link} from "@mui/material"
import SportsEsportsIcon from "@mui/icons-material/SportsEsports"
import "./header.css"
import {Link as RouterLink} from "react-router-dom"
// import Bills from "../Bills/Bills"

function Header() {
	return (
		<AppBar position="static">
			<Toolbar className="shadow" sx={{bgcolor: "#000000"}}>
				<Link component={RouterLink} to="/" underline="none">
					<IconButton aria-label="Logoicon">
						<h6 className="textologo white">RentGames</h6>
						<SportsEsportsIcon sx={{color: "white"}} />
					</IconButton>
				</Link>
				<Link component={RouterLink} to="/Bills" underline="none">
					Bills
				</Link>
			</Toolbar>
		</AppBar>
	)
}

export default Header
