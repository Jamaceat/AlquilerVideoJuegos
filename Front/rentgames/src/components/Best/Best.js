import React from "react"
import BestContext from "../Context/BestContext"
import axios from "axios"
import "./Best.css"
import {Card, CardContent, Divider} from "@mui/material"
import {useEffect} from "react"

export default function Best() {
	const {client, title, AddClient, addTitle} = BestContext()

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

			console.log(data, data2)
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
									{client.firstName + " " + client.lastName}
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
								<p className="info">{client.birthday.split("T")[0]}</p>
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
						<Divider />

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
			{/* <div className="half">



            </div> */}
		</div>
	)
}
