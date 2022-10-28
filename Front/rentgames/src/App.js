import React from "react"

import {Button, Container, AppBar, Toolbar, Tooltip} from "@mui/material"

function App() {
	return (
		<>
			<AppBar position="static">
				<Toolbar sx={{bgcolor: "#000000"}}>
					<p>Barra</p>
				</Toolbar>
			</AppBar>
			<Container>
				<p>Holaaaaa</p>
				<Button>Boton</Button>
			</Container>
		</>
	)
}

export default App
