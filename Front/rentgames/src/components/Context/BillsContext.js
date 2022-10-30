import {useState} from "react"

export const BillsContext = () => {
	const [bills, setBills] = useState([])

	const addBills = (data) => {
		const dataa = normalizarFecha(data)
		setBills(dataa)
	}

	const normalizarFecha = (data) => {
		return data.map((x) => {
			return {...x, rentedDate: x.rentedDate.split("T")[0]}
		})
	}

	return {
		bills,
		addBills,
	}
}
