import React from "react"
import BestContext from "../Context/InfoContext"
import axios from "axios"
import "./Info.css"
import {
	Card,
	CardContent,
	Divider,
	Accordion,
	AccordionSummary,
	AccordionDetails,
} from "@mui/material"
import {useEffect} from "react"
import ExpandMoreIcon from "@mui/icons-material/ExpandMore"

export default function Best() {
	const {
		client,
		title,
		menosRentados,
		daily,
		addDaily,
		addMenosRentados,
		AddClient,
		addTitle,
	} = BestContext()

	const date = new Date()

	const getData = async () => {
		try {
			const responseU = await axios.get(
				"https://localhost:44315/api/Clients/Best"
			)
			const {data} = responseU
			AddClient(data)

			const responseD = await axios.get(
				"https://localhost:44315/api/Games/MasRentado"
			)

			const {data: data2} = responseD
			addTitle(data2)

			const responseT = await axios.get(
				"https://localhost:44315/api/Games/MenosRentado"
			)
			const {data: data3} = responseT

			addMenosRentados(data3)

			const responseC = await axios.get(
				"https://localhost:44315/api/Rents/Daily"
			)
			const {data: data4} = responseC
			addDaily(data4)

			console.log(data, data2, data3, data4)
		} catch (error) {
			console.log(error)
		}
	}

	useEffect(() => {
		getData()
	}, [])

	return (
		<div className="container">
			<div className="half">
				<Card>
					<CardContent className="cardcustomizedD">
						<p className="superTitulo fondoblancotitulo">Best Client 🎊</p>
						{client && (
							<>
								<p className="subTitulo">Name</p>
								<p className="info">
									{client.firstName !== undefined &&
										client.lastName !== undefined &&
										client.firstName + " " + client.lastName}
								</p>
								<Divider />
								<p className="subTitulo">Email</p>
								<p className="info">{client.email}</p>
								<Divider />
								<p className="subTitulo">Age</p>
								<p className="info">{client.age}</p>
								<Divider />
								<p className="subTitulo">Address</p>
								<p className="info">{client.address}</p>
								<Divider />
								<p className="subTitulo">Birthday</p>
								<p className="info">
									{client.birthday !== undefined &&
										String(client.birthday).split("T")[0]}
								</p>
								<Divider />
								<p className="subTitulo">Rent Amount</p>
								<p className="info">{client.rentas}</p>
							</>
						)}
					</CardContent>
				</Card>
			</div>
			<div className="half">
				<Card>
					<CardContent className="cardcustomized">
						<p className="superTitulo fondoblancotitulo">Most rented Game 🎮</p>

						{title && (
							<>
								<p className="subTitulo">Title</p>
								<p className="info">{title.titulo}</p>
								<Divider />
								<p className="subTitulo">Identificador del juego</p>
								<p className="info">{title.idGame}</p>
								<Divider />
								<p className="subTitulo">Veces rentado</p>
								<p className="info">{title.frecuencia}</p>
							</>
						)}
					</CardContent>
				</Card>
			</div>
			<div className="half">
				<Card>
					<CardContent className="cardcustomizedT">
						<p className="superTitulo fondoblancotitulo">
							Least rented game title by age range (10) 🥱
						</p>
						<p className="fondoblancotitulo">
							The range setted is 10, the values will go from 0-9, 10-19, ...
						</p>
						<Divider />
						{menosRentados.length > 0 && (
							<>
								{menosRentados.map((x, i) => {
									return (
										<div className="rangeGrid" key={i}>
											<div className="rentItem">
												<p className="subTitulo2">Rango</p>
												<p className="info">{x.rango} </p>
											</div>
											<div className="rentItem">
												<p className="subTitulo2">Game title</p>
												<p className="info">{x.name} </p>
											</div>
											<div className="rentItem">
												<p className="subTitulo2">Rent frecuency</p>
												<p className="info">{x.frecuencia} </p>
											</div>
											<Divider />
										</div>
									)
								})}
							</>
						)}
					</CardContent>
				</Card>
			</div>
			<div className="half">
				<Card>
					<CardContent className="cardcustomizedC">
						<p className="superTitulo fondoblancotitulo">
							Daily Rents ☀️{" "}
							{date.getFullYear() +
								"/" +
								(date.getMonth() + 1) +
								"/" +
								date.getDate()}
						</p>
						<p className="fondoblancotitulo">
							The range setted is 10, the values will go from 0-9, 10-19, ...
						</p>
						<Divider />
						<p>Client name - Game Title</p>
						{daily.length > 0 ? (
							<>
								{daily.map((x, i) => {
									return (
										<div className="separado" key={i}>
											<Accordion>
												<AccordionSummary expandIcon={<ExpandMoreIcon />}>
													{" "}
													{x.firstName !== undefined &&
														x.lastName !== undefined &&
														x.gameTitle !== undefined &&
														x.firstName +
															" " +
															x.lastName +
															" - " +
															x.gameTitle}
												</AccordionSummary>
												<AccordionDetails className="rentItem">
													<p className="subTitulo3 ">Sale Identifier</p>
													<p className="normalizado">{x.idRent}</p>
													<Divider />
													<p className="subTitulo3">Email</p>
													<p className="normalizado">{x.email}</p>
													<Divider />
													<p className="subTitulo3 ">Expirations days</p>
													<p className="normalizado">{x.expirationDays}</p>
													<Divider />
													<p className="subTitulo3 ">Rental Price</p>
													<p className="normalizado">{x.rentalPrice}</p>
													<Divider />
													<p className="subTitulo3 ">Total Paid</p>
													<p className="normalizado">{x.totalPrice}</p>
												</AccordionDetails>
											</Accordion>

											<Divider />
										</div>
									)
								})}
							</>
						) : (
							<p className="superTitulo fondoblancotitulo">No sales today 🦥</p>
						)}
					</CardContent>
				</Card>
			</div>
		</div>
	)
}
