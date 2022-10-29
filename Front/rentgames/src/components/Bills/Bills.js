import React from "react"
// import {GameContext, ContextProvider} from "../Context/Provider"
import {useEffect} from "react"
import {BillsContext} from "../Context/BillsContex"
import axios from "axios"
import {DataGrid} from "@mui/x-data-grid"

const columns = [
	{field: "idRent", headerName: "IDRent", width: 70},
	{field: "idUser", headerName: "IDUser", width: 70},
	{field: "firstName", headerName: "First name", width: 130},
	{field: "lastName", headerName: "Last name", width: 130},
	{field: "email", headerName: "Email", width: 260},
	{field: "gameTitle", headerName: "Game title", width: 300},
	{field: "expirationDays", headerName: "ExpDays", width: 50},
	{
		field: "rentalPrice",
		headerName: "Rental Price",
		width: 100,
		sortable: true,
	},
	{field: "totalPrice", headerName: "Profit", width: 100, sortable: true},
	{field: "rentedDate", headerName: "Rented Day", width: 200, sortable: true},
]

function Bills() {
	const {bills, addBills} = BillsContext()

	const actualizar = async () => {
		try {
			const response = await axios.get(
				"https://localhost:44315/api/Rents/Recibo"
			)
			let {data} = response

			addBills(data)
		} catch (e) {
			console.log(e)
		}
	}

	useEffect(() => {
		actualizar()
	}, [])

	return (
		<div style={{height: "90%", width: "100%"}}>
			<DataGrid
				getRowId={(row) => row.idRent}
				rows={bills}
				columns={columns}
				pageSize={10}
				rowsPerPageOptions={[10]}
			/>
		</div>
	)
}
export default Bills
