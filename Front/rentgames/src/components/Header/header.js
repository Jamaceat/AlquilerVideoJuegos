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
				<div className="crecimiento">
					<Link component={RouterLink} to="/" underline="none">
						<IconButton className="crecimiento" aria-label="Logoicon">
							<h6 className="textologo white">RentGames</h6>
							<SportsEsportsIcon sx={{color: "white"}} />
						</IconButton>
					</Link>
				</div>
				<div className="crecimientoD">
					<Link component={RouterLink} to="/Bills" underline="none">
						<span className="botonheader">Bills</span>
					</Link>
					<Link component={RouterLink} to="/Games" underline="none">
						<span className="botonheader">Games</span>
					</Link>
					<Link component={RouterLink} to="/Info" underline="none">
						<span className="botonheader">Info</span>
					</Link>
					<Link component={RouterLink} to="/Client" underline="none">
						<span className="botonheader">Client</span>
					</Link>
				</div>
			</Toolbar>
		</AppBar>
	)
}

export default Header
