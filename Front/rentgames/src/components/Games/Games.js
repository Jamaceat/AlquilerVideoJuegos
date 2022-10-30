import React from "react"
import GameContext from "../Context/GamesContext"
import {Card, CardContent} from "@mui/material"
import "./Games.css"
import axios from "axios"
import {useEffect} from "react"
import {useRef} from "react"
import {
	List,
	ListItem,
	ListItemButton,
	ListItemText,
	ListItemIcon,
	Divider,
	Button,
	Box,
	Input,
	InputLabel,
	FormControl,
	FormHelperText,
} from "@mui/material"
import EditIcon from "@mui/icons-material/Edit"
import SearchIcon from "@mui/icons-material/Search"
import Search from "./Search/Search"

var numero
export default function Games() {
	const {games, addGames, setSwitch, enableChangePrice, pagina, addPagina} =
		GameContext()

	const textRef = useRef()
	const showRefContent = (idGame) => {
		numero = {idGame, rentalPrice: textRef.current.value}
		actualizarPrecio()
		addGames(getData())
	}

	const actualizarPrecio = async () => {
		try {
			await axios.put("https://localhost:44315/api/Games/Precio", numero)
			setSwitch(-1)
		} catch (e) {
			console.log(e)
		}
	}

	const getData = async () => {
		try {
			const response = await axios.get("https://localhost:44315/api/Games")

			const {data} = response
			addGames(data)
		} catch (e) {
			console.log(e)
		}
	}

	useEffect(() => {
		getData()
	}, [enableChangePrice])

	return (
		<div className="contenedor">
			<div className="contenedorD">
				<List>
					<ListItem className="bordeDerecho" disablePadding>
						<ListItemButton onClick={() => addPagina(0)}>
							<ListItemIcon>
								<EditIcon />
							</ListItemIcon>
							<ListItemText primary="Edit Prices" />
						</ListItemButton>
					</ListItem>
					<Divider />
					<ListItem className="bordeDerecho" disablePadding>
						<ListItemButton onClick={() => addPagina(1)}>
							<ListItemIcon>
								<SearchIcon />
							</ListItemIcon>
							<ListItemText primary="Advanced Search" />
						</ListItemButton>
					</ListItem>
					<Divider />
				</List>
			</div>
			{pagina === 0 && (
				<div className="contenedorT">
					{/* Pagina uno */}
					{games.length > 0 &&
						games.map((x) => {
							return (
								<Card sx={{width: "80%"}} key={x.idGame}>
									<CardContent>
										<h2>{x.name}</h2>
										<p>
											<b>Platform</b>:
											{x.platform
												.split(",")
												.map((x, i, a) =>
													a.length === i + 1 ? x : " " + x + " - "
												)}
										</p>
										<p>
											<b>Release Year</b>: {x.releaseYear}
										</p>
										<p>
											<b>Protagonist</b>: {x.protagonist}
										</p>
										<p>
											<b>Director</b>: {x.director}
										</p>
										<p>
											<b>Rental Price(COP)</b>: {x.rentalPrice}
										</p>
									</CardContent>
									<Button
										variant="text"
										onClick={() => {
											setSwitch(x.idGame)
										}}
										disabled={enableChangePrice.enable}
									>
										Change Rental Price
									</Button>

									{enableChangePrice.enable &&
										(enableChangePrice.only === -1 ||
											x.idGame === enableChangePrice.only) && (
											<Box component="form" sx={{marginLeft: "1rem"}}>
												<FormControl>
													<InputLabel>Price</InputLabel>
													<Input
														id="precio"
														required={true}
														autoComplete="off"
														type="number"
														inputRef={textRef}
													/>
													<FormHelperText>COP</FormHelperText>
												</FormControl>
												<Button
													variant="outlined"
													onClick={() => showRefContent(x.idGame)}
													sx={{marginRight: 1}}
												>
													Submit
												</Button>
												<Button
													variant="outlined"
													onClick={() => setSwitch(-1)}
													color="error"
												>
													Cancel
												</Button>
											</Box>
										)}
								</Card>
							)
						})}
				</div>
			)}

			{/* Pagina dos */}
			{pagina === 1 && (
				<div className="contenedorT">
					<Search />
				</div>
			)}
		</div>
	)
}
