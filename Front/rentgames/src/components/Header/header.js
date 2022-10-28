import React from "react"
import {AppBar, Toolbar, IconButton, Typography} from "@mui/material"
import SportsEsportsIcon from "@mui/icons-material/SportsEsports"
import "./header.css"

function Header() {
	return (
		<AppBar position="static">
			<Toolbar sx={{bgcolor: "#000000"}}>
				<IconButton aria-label="Logoicon">
					<Typography className="white" variant="h5">
						RentGames
					</Typography>
					<SportsEsportsIcon sx={{color: "white"}} />
				</IconButton>
			</Toolbar>
		</AppBar>
	)
}

export default Header
