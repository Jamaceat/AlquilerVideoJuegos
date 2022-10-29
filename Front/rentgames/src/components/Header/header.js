import React from "react"
import {AppBar, Toolbar, IconButton, Link} from "@mui/material"
import SportsEsportsIcon from "@mui/icons-material/SportsEsports"
import "./header.css"

function Header() {
	return (
		<AppBar position="static">
			<Toolbar sx={{bgcolor: "#000000"}}>
				<IconButton aria-label="Logoicon">
					<h6 className="textologo white">RentGames</h6>
					<SportsEsportsIcon sx={{color: "white"}} />
				</IconButton>
			</Toolbar>
		</AppBar>
	)
}

export default Header