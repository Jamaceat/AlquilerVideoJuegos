import React from "react"
// import {GameContext, ContextProvider} from "../Context/Provider"
import {useEffect} from "react"
import {BillsContext} from "../Context/BillsContex"
import axios from "axios"

function Bills() {
	const {bills, addBills} = BillsContext()

	const actualizar = async () => {
		const response = await axios.get("https://localhost:44315/api/Rents/Recibo")
		const {data} = response
		addBills(data)
	}

	useEffect(() => {
		actualizar()
	}, [])

	console.log(bills)
	return (
		<>
			{bills.length > 0 &&
				bills.map((x, i) => {
					return <p key={i}>{x.email}</p>
				})}
		</>
	)
}
export default Bills
