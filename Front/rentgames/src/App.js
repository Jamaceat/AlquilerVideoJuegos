import React from "react"
// import {useEffect} from "react"
// import axios from "axios"
import Header from "./components/Header/header"
import Welcome from "./components/Welcome/Welcome"
import Bills from "./components/Bills/Bills"
import Games from "./components/Games/Games"
import {BrowserRouter as Router, Route, Routes} from "react-router-dom"

function App() {
	return (
		<Router>
			<Header />
			<Routes>
				<Route exact path="/" element={<Welcome />} />
				<Route exact path="/Bills" element={<Bills />} />
				<Route exact path="/Games" element={<Games />} />
			</Routes>
		</Router>
	)
}

export default App
