import {
	Box,
	FormControl,
	Input,
	InputLabel,
	MenuItem,
	Select,
} from "@mui/material"
import React from "react"
import {useRef} from "react"
import SearchContext from "../../Context/SearchContext"
import {useEffect} from "react"
import "./Search.css"
import axios from "axios"
import {DataGrid} from "@mui/x-data-grid"

const listaTipos = {
	ReleaseDate: "yyyy",
	title: "Call Of Duty",
	protagonist: "CJ",
	director: "EA",
}

const columns = [
	{field: "idGame", headerName: "ID Game", width: 70},
	{field: "name", headerName: "Game Title", width: 250},
	{field: "releaseYear", headerName: "Release Year", width: 100},
	{field: "protagonist", headerName: "Protagonist", width: 150},
	{field: "director", headerName: "Director", width: 150},
	{field: "platform", headerName: "Platforms", width: 200},
	{field: "rentalPrice", headerName: "Rental Price", width: 150},
]

export default function SearchGame() {
	const {tipo, valorActual, datos, addDatos, addValorActual, addTipo} =
		SearchContext()

	const textRef = useRef()
	// const textTipo = useRef()

	const textRefFu = () => {
		const value = textRef.current.firstChild.value
		addValorActual(value)
		// addValorActual(value)
		// console.log(valorActual, "valorActual")
		// console.log(datos)
	}

	useEffect(() => {
		valorActual === "" ? allData() : Busqueda()
	}, [valorActual])

	const allData = async () => {
		try {
			const response = await axios.get("https://localhost:44315/api/Games")
			const {data} = response
			addDatos(data)
		} catch (e) {
			console.log(e)
		}
	}

	const Busqueda = async () => {
		try {
			const nuevoTexto = valorActual.split(" ").join("%20")
			const response = await axios.get(
				`https://localhost:44315/api/Games/InfoGames/${tipo}/${nuevoTexto}`
			)
			const {data} = response
			addDatos(data)
		} catch (e) {
			console.log(e)
		}
	}

	// useEffect(() => {

	// })

	return (
		<div>
			<div className="searchCont">
				<div className="formulario">
					{tipo === "ReleaseDate" ? (
						<FormControl fullWidth>
							<InputLabel>Date</InputLabel>
							<Input
								placeholder={listaTipos[tipo]}
								id="precio"
								required={true}
								onChange={textRefFu}
								autoComplete="off"
								type="number"
								ref={textRef}
							/>
						</FormControl>
					) : (
						<FormControl onChange={textRefFu} fullWidth>
							<InputLabel>
								{tipo[0].toUpperCase() + tipo.substring(1)}
							</InputLabel>
							<Input
								placeholder={listaTipos[tipo]}
								id="precio"
								onChange={textRefFu}
								required={true}
								autoComplete="off"
								type="text"
								ref={textRef}
							/>
						</FormControl>
					)}
					<Box sx={{marginTop: 2, width: "13rem"}}>
						<FormControl sx={{width: "13rem"}}>
							<InputLabel>Tipo</InputLabel>
							<Select
								defaultValue={"ReleaseDate"}
								onChange={(event) => {
									addTipo(event.target.value)
								}}
								label="tipo"
							>
								<MenuItem value={"ReleaseDate"}>Release Date</MenuItem>
								<MenuItem value={"title"}>Game title</MenuItem>
								<MenuItem value={"protagonist"}>Protagonist</MenuItem>
								<MenuItem value={"director"}>Director</MenuItem>
							</Select>
						</FormControl>
					</Box>
				</div>

				<div style={{height: "55%", width: "100%"}}>
					<DataGrid
						getRowId={(row) => row.idGame}
						rows={datos}
						columns={columns}
						pageSize={5}
						rowsPerPageOptions={[5]}
					/>
				</div>
			</div>
		</div>
	)
}
