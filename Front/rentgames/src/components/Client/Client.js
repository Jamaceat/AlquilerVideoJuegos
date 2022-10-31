import React, {useRef} from "react"
import "./Client.css"
import {
	Button,
	Input,
	FormControl,
	InputLabel,
	Box,
	FormLabel,
	Paper,
	Divider,
} from "@mui/material"
import {DataGrid} from "@mui/x-data-grid"
import axios from "axios"
import ClientContext from "../Context/ClientContex"

const columns = [
	{field: "idRent", headerName: "IDRent", width: 70},
	{field: "gameTitle", headerName: "Game Title", width: 300},
	{field: "rentedDate", headerName: "Rented Date", width: 200},
	{field: "returnDate", headerName: "Return Date", width: 200},
	{field: "rentalPrice", headerName: "Game rental price", width: 150},
	{field: "expirationDays", headerName: "ExpDays", width: 100},
	{field: "totalPrice", headerName: "Total Paid", width: 310},
]

export default function Client() {
	// states
	const {user, datos, activo, addActivo, addUser, addDatos} = ClientContext()

	// conseguir la info del input
	const idRef = useRef()

	// Peticiones

	// Conseguir usuario
	const toUser = async () => {
		const {value} = idRef.current.firstChild
		console.log(value)
		if (value > 0) {
			try {
				const response = await axios.get(
					`https://localhost:44315/api/Clients/${value}`
				)
				const {data} = response
				console.log(data)
				addUser(data)

				const response2 = await axios.get(
					`https://localhost:44315/api/Rents/UserInfo/${value}`
				)
				const {data: data2} = response2
				console.log(
					data2,
					"data2",
					`https://localhost:44315/api/Rents/UserInfo/${value}`
				)
				addDatos(data2)
				addActivo(true)
			} catch (e) {
				console.log(e)
			}
		}
	}

	return (
		<>
			<div className="gContainer">
				<Box className="gContainerD">
					<FormControl disabled={activo} fullWidth>
						<FormLabel>Enter user ID</FormLabel>
						<InputLabel sx={{marginTop: "2rem"}}>ID</InputLabel>
						<Input ref={idRef} type="number" />
						<Button
							onClick={toUser}
							disabled={activo}
							variant="contained"
							sx={{marginTop: "2rem"}}
						>
							Submit
						</Button>
					</FormControl>
				</Box>

				{activo && <Button onClick={addActivo}>Close</Button>}

				{activo === true && (
					<div>
						<Paper
							className="gUser"
							sx={{padding: "1.5rem", fontFamily: "sans-serif"}}
							elevation={3}
						>
							<Paper elevation={1} sx={{margin: "1rem", minHeight: 100}}>
								<h2 className="tMargin">Full name</h2>
								<Divider />
								<h3 className="tMarginD">
									{user.firstName} {user.lastName}
								</h3>
							</Paper>
							<Paper elevation={1} sx={{margin: "1rem", minHeight: 100}}>
								<h2 className="tMargin">Email</h2>
								<Divider />
								<h3 className="tMarginD">{user.email}</h3>
							</Paper>
							<Paper elevation={1} sx={{margin: "1rem", minHeight: 100}}>
								<h2 className="tMargin">Age</h2>
								<Divider />
								<h3 className="tMarginD">{user.age}</h3>
							</Paper>

							<Paper elevation={1} sx={{margin: "1rem", minHeight: 100}}>
								<h2 className="tMargin">Address</h2>
								<Divider />
								<h3 className="tMarginD">{user.address}</h3>
							</Paper>
							<Paper elevation={1} sx={{margin: "1rem", minHeight: 100}}>
								<h2 className="tMargin">Birthday</h2>
								<Divider />
								<h3 className="tMarginD">
									{String(user.birthday).split("T")[0]}
								</h3>
							</Paper>
							<Paper elevation={1} sx={{margin: "1rem", minHeight: 100}}>
								<h2 className="tMargin">Gender</h2>
								<Divider />
								<h3 className="tMarginD">{user.gender}</h3>
							</Paper>
						</Paper>
						<Paper
							sx={{padding: "1.5rem", fontFamily: "sans-serif"}}
							elevation={3}
						>
							<h2>Balance</h2>
							<Divider />
							<h3 className="tMarginD">
								{datos.reduce((cont, x) => (cont += x.totalPrice), 0)}
							</h3>
						</Paper>
						<Paper
							sx={{
								padding: "1.5rem",
								marginTop: "2rem",
								fontFamily: "sans-serif",
							}}
							elevation={3}
						>
							<h2>Rents number</h2>
							<Divider />
							<h3 className="tMarginD">{datos.length}</h3>
						</Paper>
						<Paper
							sx={{
								padding: "1.5rem",
								marginTop: "2rem",
								fontFamily: "sans-serif",
								height: "30rem",
							}}
							elevation={3}
						>
							<h2>Detail Rents</h2>
							<Box sx={{height: "25rem"}}>
								<DataGrid
									getRowId={(row) => row.idRent}
									rows={datos}
									columns={columns}
									pageSize={5}
									rowsPerPageOptions={[5]}
								/>
							</Box>
						</Paper>
					</div>
				)}
			</div>
		</>
	)
}
