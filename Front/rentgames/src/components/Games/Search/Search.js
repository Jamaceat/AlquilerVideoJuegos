import {
	Container,
	Box,
	FormControl,
	Input,
	InputLabel,
	FormHelperText,
	Button,
	MenuItem,
	Select,
} from "@mui/material"
import React from "react"
import {useRef} from "react"
import SearchContext from "../../Context/SearchContext"
import {useEffect} from "react"

const listaTipos = {
	ReleaseDate: "yyyy-mm-dd",
	title: "Call Of Duty",
	protagonist: "CJ",
	director: "EA",
}

export default function SearchGame() {
	const {tipo, valorActual, addValorActual, addTipo} = SearchContext()

	const textRef = useRef()
	// const textTipo = useRef()

	const textRefFu = () => {
		addValorActual(textRef.current.firstChild.value)
	}

	// useEffect(() => {

	// })

	return (
		<>
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
					<InputLabel>{tipo[0].toUpperCase() + tipo.substring(1)}</InputLabel>
					<Input
						placeholder={listaTipos[tipo]}
						id="precio"
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
		</>
	)
}
